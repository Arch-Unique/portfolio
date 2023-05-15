import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/src/features/home/home_page.dart';
import 'package:portfolio/src/features/projects/project.dart';
import 'package:portfolio/src/global/controller/app_controller.dart';
import 'src/features/error404.dart';
import 'src/src_barrel.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    return GetMaterialApp(
      title: 'Archyuniq',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'GB'), // English
      ],
      theme: ThemeData(
        fontFamily: Assets.appFontFamily,
        scaffoldBackgroundColor: AppColors.primaryColorBackground,
      ),
      initialRoute: '/home',
      unknownRoute: GetPage(name: "/404", page: () => Error404Widget()),
      getPages: [
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
        ),
        GetPage(
          name: "/projects",
          page: () => ProjectWidget(),
        ),
      ],
    );
  }
}
