import '../../utils/utils_barrel.dart';

class UrlButtonModel {
  final String url, msg;

  const UrlButtonModel(this.msg, this.url);
}

class UrlButtonController {
  static List<UrlButtonModel> urlbutton(Projects project) {
    final List<String> urls = project.urls;
    List<UrlButtonModel> urlbuttonModels = [];
    for (int i = 0; i < urls.length; i++) {
      String url = urls[i];
      if (url.contains("play.google.com")) {
        urlbuttonModels.add(UrlButtonModel("View on Playstore", url));
      } else if (url.contains(".apk")) {
        urlbuttonModels.add(UrlButtonModel("Download APK", url));
      } else if (url.contains("testflight")) {
        urlbuttonModels.add(UrlButtonModel("View on TestFlight", url));
      } else if (url.contains("apps.apple.com")) {
        urlbuttonModels.add(UrlButtonModel("View on AppStore", url));
      } else if (url.contains("github")) {
        urlbuttonModels.add(UrlButtonModel("View on Github", url));
      } else {
        urlbuttonModels.add(UrlButtonModel("View Backend", url));
      }
    }
    return urlbuttonModels;
  }
}
