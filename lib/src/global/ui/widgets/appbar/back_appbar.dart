import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/src/global/controller/app_controller.dart';
import 'package:portfolio/src/global/ui/functions/ui_functions.dart';
import 'package:portfolio/src/global/ui/widgets/text/app_text.dart';
import 'package:portfolio/src/src_barrel.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Ui.width(context),
      padding: EdgeInsets.symmetric(
          vertical: 24, horizontal: Ui.isSmallScreen(context) ? 24 : 72),
      color: AppColors.secondaryColor,
      child: Row(
        mainAxisAlignment: Ui.width(context) > 670
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          AppText.thin("Archyuniq", fontSize: 24),
          if (Ui.width(context) > 670)
            // ? IconButton(
            //     onPressed: () {
            //       Scaffold.of(context).openEndDrawer();
            //     },
            //     icon: Icon(
            //       Icons.menu,
            //       color: AppColors.white,
            //     ))
            // :
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  4,
                  (index) => InkWell(
                        onTap: () {
                          appController.curPage.value = index + 1;
                          appController.scrollTo(context, index);
                        },
                        onHover: (b) {
                          // if ((index + 1) == appController.curPage.value) {
                          //   return;
                          // }
                          appController.curPage.value = b ? index + 1 : 0;
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Obx(() {
                            return AppText(AppController.pages[index],
                                fontSize: 14,
                                weight: appController.curPage.value == index + 1
                                    ? FontWeight.w500
                                    : FontWeight.w300,
                                color: appController.curPage.value == index + 1
                                    ? AppColors.primaryColor
                                    : AppColors.white);
                          }),
                        ),
                      )),
            )
        ],
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  HomeMenu({super.key});
  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Ui.width(context),
      height: Ui.height(context),
      color: AppColors.secondaryColor.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            5,
            (index) => index == 4
                ? IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeEndDrawer();
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColors.white,
                    ))
                : InkWell(
                    onTap: () {
                      appController.curPage.value = index + 1;
                      appController.scrollTo(context, index);
                      Scaffold.of(context).closeEndDrawer();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Obx(() {
                        return AppText(AppController.pages[index],
                            fontSize: 36,
                            weight: appController.curPage.value == index + 1
                                ? FontWeight.w500
                                : FontWeight.w300,
                            color: appController.curPage.value == index + 1
                                ? AppColors.primaryColor
                                : AppColors.white);
                      }),
                    ),
                  )),
      ),
    );
  }
}
