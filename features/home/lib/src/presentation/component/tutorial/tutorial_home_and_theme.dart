import 'package:component/component.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

class TutorialHomeAndTheme extends StatelessWidget {
  const TutorialHomeAndTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.current.tutorial_home_and_theme_guide_1,
          style: CustomTextStyle.TITLE_14.apply(
            color: Colors.white,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: S.current.tutorial_home_and_theme_guide_2,
                style: CustomTextStyle.TITLE_14.apply(
                  color: Colors.white,
                ),
              ),
              WidgetSpan(
                child: SizedBox(
                  height: 14,
                  width: 12,
                  child: OverflowBox(
                    maxWidth: 38,
                    maxHeight: 42,
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(AssetsPath.icGuideRow),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          decoration: BoxDecoration(
            color: StaticColors.background_begin_gradient,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: DashesBorder(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetsPath.icPlus),
                  const SizedBox(width: Dimens.dp4),
                  Text(
                    S.current.add_my_own_theme,
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.BODY_14.apply(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
