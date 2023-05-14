import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/global/ui/widgets/others/containers.dart';

import '../../../global/ui/ui_barrel.dart';
import '../../../src_barrel.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({
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
      padding: EdgeInsets.all(Ui.width(context) >= 650 ? 72 : 24),
      child: Column(
        children: [
          AppText.bold("Services", fontSize: 24),
          Ui.boxHeight(24),
          if (Ui.isMediumScreen(context))
            MediumScreenWidget(
                children: List.generate(4, (i) => serviceItem(context, i))),
          if (Ui.isSmallScreen(context))
            SmallScreenWidget(
                children: List.generate(
                    4,
                    (i) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: serviceItem(context, i),
                        ))),
          if (Ui.isLargeScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (i) => serviceItem(context, i)),
            )
        ],
      ),
    );
  }

  Container serviceItem(BuildContext context, int i) {
    return Container(
      width: Ui.isLargeScreen(context)
          ? (Ui.width(context) - 216) / 4
          : Ui.isMediumScreen(context)
              ? Ui.width(context) / 3
              : Ui.width(context) - 56,
      height: Ui.isLargeScreen(context) ? Ui.height(context) - 272 : null,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          SvgPicture.asset(
            Service.values[i].icon,
            width: 88,
            height: 88,
          ),
          Ui.boxHeight(32),
          AppText.medium(Service.values[i].name),
          Ui.boxHeight(8),
          AppText.thin(Service.values[i].desc, fontSize: 12),
          Ui.boxHeight(8),
          Ui.isLargeScreen(context) ? const Spacer() : Ui.boxHeight(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.star,
                      color: index < Service.values[i].scale
                          ? AppColors.gold
                          : AppColors.grey,
                    )),
          ),
        ],
      ),
    );
  }
}
