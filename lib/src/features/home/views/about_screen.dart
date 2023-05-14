import 'package:flutter/material.dart';
import 'package:portfolio/src/global/ui/widgets/others/containers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../global/ui/ui_barrel.dart';
import '../../../src_barrel.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    Key? key,
    required this.offsetBottom,
  }) : super(key: key);

  final int offsetBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Ui.width(context),
        // height: Ui.height(context) - offsetBottom,
        height: Ui.isLargeScreen(context) ? Ui.height(context) - 64 : null,
        color: AppColors.secondaryColor,
        padding: EdgeInsets.all(Ui.isLargeScreen(context) ? 72 : 24),
        child: Ui.isSmallScreen(context)
            ? SmallScreenWidget(children: [
                Image.asset(Assets.aboutme),
                Ui.boxHeight(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText.bold("About Me", fontSize: 24),
                    Ui.boxHeight(16),
                    AppText.thin(
                        "As a four-year experienced Flutter and backend developer, I excel in building performant, user-friendly, and cross-platform mobile applications. I specialize in using the Flutter framework to create seamless user experiences for Android and iOS platforms, and in Node.js development to build scalable and efficient server-side solutions.\n\nMy passion for creating high-quality applications is matched only by my attention to detail and commitment to meeting the highest standards of functionality and security.",
                        fontSize: 15),
                  ],
                ),
                Ui.boxHeight(16),
                Row(
                  children: [
                    Expanded(child: githubBtn()),
                    Ui.boxWidth(24),
                    Expanded(child: cvBtn()),
                  ],
                )
              ])
            : Row(
                children: [
                  Expanded(child: Image.asset(Assets.aboutme)),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.bold("About Me", fontSize: 24),
                      Ui.boxHeight(16),
                      AppText.thin(
                          "As a four-year experienced Flutter and backend developer, I excel in building performant, user-friendly, and cross-platform mobile applications. I specialize in using the Flutter framework to create seamless user experiences for Android and iOS platforms, and in Node.js development to build scalable and efficient server-side solutions.\n\nMy passion for creating high-quality applications is matched only by my attention to detail and commitment to meeting the highest standards of functionality and security.",
                          fontSize: 15),
                      Ui.boxHeight(24),
                      Ui.isMediumScreen(context)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: 220, child: githubBtn()),
                                Ui.boxHeight(24),
                                SizedBox(width: 220, child: cvBtn()),
                              ],
                            )
                          : Row(
                              children: [
                                SizedBox(width: 220, child: githubBtn()),
                                Ui.boxWidth(24),
                                SizedBox(width: 220, child: cvBtn()),
                              ],
                            )
                    ],
                  )),
                ],
              ));
  }

  FilledButton githubBtn() {
    return FilledButton(
      onPressed: () async {
        await launchUrl(Uri.parse("https://github.com/Arch-Unique"));
      },
      text: "View Github",
    );
  }

  Widget cvBtn() {
    return FilledButton.white(
      () {},
      "CV",
    );
  }
}
