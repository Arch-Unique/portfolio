import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:portfolio/src/global/ui/ui_barrel.dart';
import 'package:portfolio/src/global/ui/widgets/others/containers.dart';
import 'package:portfolio/src/src_barrel.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key});

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  int i = 0;
  final controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    i = Get.arguments?["index"] ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            projectHeader(),
            Ui.boxHeight(Ui.isLargeScreen(context) ? 48 : 24),
            if (Ui.isLargeScreen(context))
              Row(
                children: [
                  projecLogo(),
                  Expanded(
                    child: SizedText(
                        space: 304,
                        child: AppText.thin(Projects.values[i].desc)),
                  ),
                ],
              ),
            if (!Ui.isLargeScreen(context))
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: projecLogo(),
              ),
            if (!Ui.isLargeScreen(context))
              SizedText(
                  space: 32, child: AppText.thin(Projects.values[i].desc)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: UrlButtons(i),
            ),
            Scrollbar(
              controller: controller,
              child: SingleChildScrollView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  children: List.generate(
                    Projects.values[i].imgs.length,
                    (index) => Container(
                        width: Ui.isLargeScreen(context)
                            ? 300
                            : Ui.isMediumScreen(context)
                                ? 250
                                : 200,
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: Image.asset(
                            Projects.values[i].imgs[index],
                          ),
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile projectHeader() {
    return ListTile(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close, color: AppColors.white)),
      title: AppText.bold(Projects.values[i].name),
    );
  }

  Row projecLogo() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            child: Image.asset(
              Projects.values[i].icon,
              width: 128,
              height: 128,
            )),
        Ui.boxWidth(12),
        SizedBox(
          height: 128,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Assets.android, width: 24, height: 24),
              (Projects.values[i].no == 2)
                  ? Image.asset(Assets.ios, width: 24, height: 24)
                  : SizedBox(height: 24),
              (Projects.values[i].no == 13)
                  ? Image.asset(Assets.nodejspng, width: 24, height: 24)
                  : SizedBox(height: 24),
            ],
          ),
        ),
        if (Ui.isLargeScreen(context)) Ui.boxWidth(32),
      ],
    );
  }
}
