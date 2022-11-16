import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class TutorialBottomNav extends StatelessWidget {
  const TutorialBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 165,
                child: Text(
                  S.current.tutorial_bottom_nav_guide,
                  style: CustomTextStyle.TITLE_14.apply(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(AssetsPath.icGuideRowBottomNav),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            height: kBottomNavigationBarHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: itemTutorialBottomNav(
                      image: AssetsPath.homeNavigationON,
                      titleBottomNav: S.current.navigation_home,
                      color: StaticColors.premium_begin_gradient,
                    ),
                  ),
                  Expanded(
                    child: itemTutorialBottomNav(
                      image: AssetsPath.guideNavigationOFF,
                      titleBottomNav: S.current.navigation_guide,
                      color: StaticColors.white,
                    ),
                  ),
                  Expanded(
                    child: itemTutorialBottomNav(
                      image: AssetsPath.reportNavigationOFF,
                      titleBottomNav: S.current.navigation_report,
                      color: StaticColors.white,
                    ),
                  ),
                  Expanded(
                    child: itemTutorialBottomNav(
                      image: AssetsPath.settingNavigationOFF,
                      titleBottomNav: S.current.navigation_setting,
                      color: StaticColors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemTutorialBottomNav(
      {required String image,
      required String titleBottomNav,
      required Color color}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(image),
        const SizedBox(
          height: 5,
        ),
        Text(
          titleBottomNav,
          style: CustomTextStyle.BODY_12.apply(
            color: color,
          ),
        ),
      ],
    );
  }
}
