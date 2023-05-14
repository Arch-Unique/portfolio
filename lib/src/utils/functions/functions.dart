import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '/src/utils/utils_barrel.dart';

///file for all #resusable functions
///Guideline: strongly type all variables and functions

abstract class UtilFunctions {
  static const pideg = 180 / pi;

  static double deg(double a) => a / pideg;

  static clearTextEditingControllers(List<TextEditingController> conts) {
    for (var i = 0; i < conts.length; i++) {
      conts[i].clear();
    }
  }


  static String getDioError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        return ErrorStrings.connectionTimeout;

      case DioErrorType.cancel:
        return ErrorStrings.requestCanceled;

      case DioErrorType.sendTimeout:
        return ErrorStrings.sendTimeout;

      case DioErrorType.receiveTimeout:
        return ErrorStrings.receiveTimeout;

      case DioErrorType.response:
        {
          return "Error ${e.response?.statusCode}: ${e.response?.data['msg']}";
        }
      case DioErrorType.other:
        return ErrorStrings.unknown;
    }
  }
}
