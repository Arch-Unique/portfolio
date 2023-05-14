import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:portfolio/src/global/ui/ui_barrel.dart';
import 'package:portfolio/src/src_barrel.dart';

class Error404Widget extends StatelessWidget {
  const Error404Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.bold("Error 404", fontSize: 48),
            Ui.boxHeight(24),
            AppText.medium("Nothing here :(", fontSize: 24),
            Ui.boxHeight(24),
            InkWell(
                onTap: () {
                  Get.toNamed("/home");
                },
                child: AppText.thin("Go To Archyuniq"))
          ],
        ),
      ),
    );
  }
}
