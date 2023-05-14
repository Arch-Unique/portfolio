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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.bold("Archyuniq", fontSize: 24),
          Ui.width(context) < 670
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: AppColors.white,
                  ))
              : Row(
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
                                    weight:
                                        appController.curPage.value == index + 1
                                            ? FontWeight.w500
                                            : FontWeight.w300,
                                    color:
                                        appController.curPage.value == index + 1
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
