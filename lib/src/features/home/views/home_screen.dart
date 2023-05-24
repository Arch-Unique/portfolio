import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/src/global/ui/widgets/others/containers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import '../../../global/ui/ui_barrel.dart';
import '../../../src_barrel.dart';
import 'package:three_dart/three_dart.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
    required this.offsetBottom,
  }) : super(key: key);

  final int offsetBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Ui.width(context),
        height: Ui.isLargeScreen(context) ? Ui.height(context) - 64 : null,
        color: AppColors.primaryColorBackground,
        padding: EdgeInsets.all(Ui.isSmallScreen(context) ? 24 : 72),
        child: Ui.isSmallScreen(context)
            ? SmallScreenWidget(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.thin("Hello, I'm"),
                    Ui.boxHeight(16),
                    AppText.bold("IDIGO IKENNA", fontSize: 48),
                    Ui.boxHeight(16),
                    AppText.medium(
                        "A mobile app developer for Android and iOS with a knack for backend development, sprinkled with a bit of embedded systems and blockchain."),
                    Ui.boxHeight(16),
                    contactBtn()
                  ],
                )
              ])
            : Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.thin("Hello, I'm"),
                      Ui.boxHeight(16),
                      AppText.bold("IDIGO IKENNA", fontSize: 48),
                      Ui.boxHeight(16),
                      AppText.medium(
                          "A mobile app developer for Android and iOS with a knack for backend development, sprinkled with a bit of embedded systems and blockchain."),
                      Ui.boxHeight(16),
                      SizedBox(
                        width: 220,
                        child: contactBtn(),
                      )
                    ],
                  )),
                  Expanded(child: Container())
                ],
              ));
  }

  FilledButton contactBtn() {
    return FilledButton(
      onPressed: () async {
        await launchUrl(Uri.parse("https://wa.link/3zhnl0"));
      },
      icon: LineAwesome.whatsapp,
      text: "Whatsapp",
    );
  }
}
