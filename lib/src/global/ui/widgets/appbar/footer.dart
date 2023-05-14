import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/src/global/controller/app_controller.dart';
import 'package:portfolio/src/global/ui/functions/ui_functions.dart';
import 'package:portfolio/src/global/ui/widgets/text/app_text.dart';
import 'package:portfolio/src/src_barrel.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Ui.width(context),
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 72),
      color: AppColors.footer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //  Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: List.generate(
          //               3,
          //               (index) => InkWell(
          //                     onTap: () {

          //                     },
          //                     onHover: (b) {
          //                       appController.curPage.value = b ? index + 1 : 0;
          //                     },
          //                     child: Padding(
          //                       padding: EdgeInsets.symmetric(horizontal: 24),
          //                       child: Obx(() {
          //                         return AppText(AppController.pages[index],
          //                             fontSize: 14,
          //                             weight:
          //                                 appController.curPage.value == index + 1
          //                                     ? FontWeight.w500
          //                                     : FontWeight.w300,
          //                             color:
          //                                 appController.curPage.value == index + 1
          //                                     ? AppColors.primaryColor
          //                                     : AppColors.white);
          //                       }),
          //                     ),
          //                   )),
          //         ),
          AppText.thin("Made with Flutter by Archyuniq", fontSize: 12),
        ],
      ),
    );
  }
}
