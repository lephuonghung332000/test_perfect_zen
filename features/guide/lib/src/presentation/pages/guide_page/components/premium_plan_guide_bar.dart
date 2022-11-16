import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class PremiumPlanGuideBar extends StatelessWidget {
  final Function onclick;
  const PremiumPlanGuideBar({Key? key, required this.onclick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: Dimens.dp100),
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            StaticColors.gradient_white_7,
            StaticColors.gradient_white_9,
            StaticColors.gradient_white_95,
            StaticColors.gradient_white_100,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            S.current.to_access_more_meditation_guide_upgrade_your_plan,
            style: CustomTextStyle.TITLE_12.apply(color: StaticColors.gray),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              onclick.call();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.current.upgrade_now,
                  style: CustomTextStyle.TITLE_14
                      .apply(color: StaticColors.purple_upgrade_plan),
                ),
                const SizedBox(
                  width: 4,
                ),
                SvgPicture.asset(AssetsPath.icArrowRight)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
