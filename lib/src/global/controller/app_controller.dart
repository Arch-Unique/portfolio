import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:portfolio/src/global/ui/functions/ui_functions.dart';

class AppController extends GetxController {
  final ScrollController scrollController = ScrollController();
  static const List<String> pages = [
    "About Me",
    "Services",
    "Skills",
    "Projects"
  ];
  RxInt curPage = 0.obs;

  scrollTo(BuildContext context, int i) {
    scrollController.animateTo((Ui.height(context) - 64) * (i + 1),
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
