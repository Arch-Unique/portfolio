import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/global/ui/widgets/others/containers.dart';

import '../../../global/ui/ui_barrel.dart';
import '../../../src_barrel.dart';

class SkillScreen extends StatelessWidget {
  const SkillScreen({
    Key? key,
    required this.offsetBottom,
  }) : super(key: key);

  final int offsetBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Ui.width(context),
      height: Ui.isLargeScreen(context) ? Ui.height(context) - 64 : null,
      color: AppColors.secondaryColor,
      padding: EdgeInsets.all(Ui.width(context) >= 650 ? 72 : 24),
      child: Column(children: [
        AppText.bold("Skills", fontSize: 24),
        Ui.boxHeight(24),
        if (Ui.isMediumScreen(context))
          SmallScreenWidget(
            children: List.generate(
                6,
                (i) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                            List.generate(3, (j) => skillItem((i * 3) + j)),
                      ),
                    )),
          ),
        if (Ui.isSmallScreen(context))
          SmallScreenWidget(
            children: List.generate(
                9,
                (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                            List.generate(2, (j) => skillItem((i * 2) + j)),
                      ),
                    )),
          ),
        if (Ui.isLargeScreen(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) => skillItem(index)),
          ),
        if (Ui.isLargeScreen(context)) Ui.boxHeight(24),
        if (Ui.isLargeScreen(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) => skillItem(index + 6)),
          ),
        if (Ui.isLargeScreen(context)) Ui.boxHeight(24),
        if (Ui.isLargeScreen(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) => skillItem(index + 12)),
          ),
      ]),
    );
  }

  skillItem(int i) {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.primaryColorBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Ui.boxHeight(8),
          SvgPicture.asset(
            Skills.values[i].icon,
            width: 48,
            height: 48,
          ),
          Ui.boxHeight(8),
          AppText.thin14(Skills.values[i].name),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100 * Skills.values[i].no / 5,
              height: 4,
              color: AppColors.footer,
            ),
          )
        ],
      ),
    );
  }
}
