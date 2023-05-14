import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/src/features/home/views/project_screen.dart';
import 'package:portfolio/src/global/controller/app_controller.dart';
import 'package:portfolio/src/global/ui/widgets/appbar/footer.dart';
import 'package:portfolio/src/global/ui/widgets/others/containers.dart';
import 'package:portfolio/src/src_barrel.dart';

import '../../global/ui/ui_barrel.dart';
import 'views/about_screen.dart';
import 'views/home_screen.dart';
import 'views/service_screen.dart';
import 'views/skill_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<AppController>();
  bool isRefreshing = false;
  final offsetBottom = 64;

  @override
  void initState() {
    controller.scrollController.addListener(() {
      if (mounted) {
        controller.curPage.value =
            (controller.scrollController.position.pixels /
                        (Ui.height(context) - offsetBottom))
                    .ceil() -
                1;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HeaderWidget(),
        Expanded(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          controller: controller.scrollController,
          child: Column(
            children: [
              FirstScreen(offsetBottom: offsetBottom),
              AboutScreen(offsetBottom: offsetBottom),
              ServiceScreen(offsetBottom: offsetBottom),
              SkillScreen(offsetBottom: offsetBottom),
              ProjectScreen(),
              FooterWidget()
            ],
          ),
        ))
      ],
    ));
  }
}
