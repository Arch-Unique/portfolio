import 'dart:convert';

import 'package:dio/dio.dart';

import '../../src_barrel.dart';
import '../ui/ui_barrel.dart';

// import '../../src_barrel.dart';

class HttpService {
  static final _dio = Dio();
  static const String baseURI = "https://api.taams.com.ng/api";
  static const String attendanceURI = "$baseURI/rawattendance";
  // static const String authcodeURI = "$baseURI/authcode";
  static const String userURI = "$baseURI/user";
  static const String schoolURI = "$baseURI/school";
  static const String staffURI = "$baseURI/staff";

  static Future<List<String>> getSchools() async {
    try {
      final res = await _dio.get(schoolURI);

      if (res.statusCode == 200) {
        final c = res.data;
        List<String> g = [];
        for (Map<String, dynamic> item in c) {
          g.add(item["school"]);
        }
        if (g.isEmpty) {
          Ui.showSnackBar("No Schools Found");
        }

        return g;
      } else {
        Ui.showSnackBar("Error ${res.statusCode}: ${res.statusMessage}");
      }
      return [];
    } on DioError catch (e) {
      String msg = UtilFunctions.getDioError(e);
      Ui.showSnackBar(msg);
      return [];
    } catch (e) {
      Ui.showSnackBar(e.toString());

      return [];
    }
  }

  static Future<bool> login(int userType, String school, String user) async {
    String uri = "$userURI/app-login";

    try {
      final res = await _dio.post(uri,
          data: {"userType": userType, "school": school, "userName": user});

      if (res.statusCode == 200) {
        // await MyPrefs.login(userType, school, user);
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      String msg = UtilFunctions.getDioError(e);
      Ui.showSnackBar(msg);
      return false;
    } catch (e) {
      Ui.showSnackBar(e.toString());

      return false;
    }
  }

  static Future<List<String>> getCoursesByStaff(String id) async {
    String uri = "$staffURI/get-courses";

    try {
      final res = await _dio.post(uri, data: {"staffid": id});

      if (res.statusCode == 200) {
        final c = res.data;
        List<String> g = [];
        for (Map<String, dynamic> item in c) {
          g.add(item["coursecode"]);
        }
        if (g.isEmpty) {
          Ui.showSnackBar("No Course Found");
        }

        return g;
      } else {
        return [];
      }
    } on DioError catch (e) {
      String msg = UtilFunctions.getDioError(e);
      Ui.showSnackBar(msg);
      return [];
    } catch (e) {
      Ui.showSnackBar(e.toString());

      return [];
    }
  }
}
