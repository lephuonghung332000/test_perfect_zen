import 'package:flutter/material.dart';

import '../../../../guide.dart';
import 'guide_action_button.dart';
import 'guide_theme_image.dart';
import 'guide_theme_info.dart';

class GuideThemeItem extends StatelessWidget {
  final GuideThemeViewModel viewModel;
  final Function? onClickPlay;

  const GuideThemeItem({
    Key? key,
    required this.viewModel,
    this.onClickPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            GuideThemeImage(
              image: viewModel.image,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GuideThemeInfo(
                      isPremium: viewModel.isPremium,
                      time: viewModel.time,
                      title: viewModel.title)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GuideActionButton(
                onClickPlay: () {
                  onClickPlay?.call();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
