import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/src/features/projects/project.dart';
import 'package:portfolio/src/global/ui/widgets/others/containers.dart';

import '../../../global/ui/ui_barrel.dart';
import '../../../src_barrel.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Ui.width(context),
      height: Ui.isLargeScreen(context) ? Ui.height(context) - 64 : null,
      color: AppColors.primaryColorBackground,
      padding: EdgeInsets.all(Ui.width(context) >= 650 ? 72 : 24),
      child: Column(children: [
        AppText.bold("Projects", fontSize: 24),
        Ui.boxHeight(24),
        if (Ui.isMediumScreen(context))
          MediumScreenWidget(
            children: List.generate(8, (index) => projectItem(index)),
          ),
        if (Ui.isSmallScreen(context))
          SmallScreenWidget(
            children: List.generate(
                8,
                (index) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: projectItem(index),
                    )),
          ),
        if (Ui.isLargeScreen(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) => projectItem(index)),
          ),
        if (Ui.isLargeScreen(context)) Ui.boxHeight(24),
        if (Ui.isLargeScreen(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) => projectItem(index + 4)),
          ),
      ]),
    );
  }

  Widget projectItem(int index) {
    bool c = true;
    return StatefulBuilder(builder: (context, setState) {
      return InkWell(
        onTap: () {
          Get.toNamed("/projects", arguments: {"index": index});
        },
        onHover: (b) {
          setState(() {
            c = !b;
          });
        },
        child: Container(
          padding: EdgeInsets.all(24),
          // height: (Ui.height(context) - 216) / 2,
          width: (Ui.height(context) - 216) / 2,
          // width: 128,
          decoration: BoxDecoration(
              color: c ? AppColors.secondaryColor : AppColors.transparent,
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(24)),
                  child: Image.asset(
                    Projects.values[index].icon,
                    width: 88,
                    height: 88,
                  )),
              Ui.boxHeight(16),
              AppText.medium(Projects.values[index].name),
            ],
          ),
        ),
      );
    });
  }
}
