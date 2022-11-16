import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class TutorialPlayButton extends StatelessWidget {
  const TutorialPlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: SvgPicture.asset(AssetsPath.icGuideRowRight),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: StaticColors.add_theme_background_purple,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(AssetsPath.icPlayMusic),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 167,
          child: Text(
            S.current.tutorial_play_botton_guide,
            style: CustomTextStyle.TITLE_14.apply(
              color: Colors.white,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
