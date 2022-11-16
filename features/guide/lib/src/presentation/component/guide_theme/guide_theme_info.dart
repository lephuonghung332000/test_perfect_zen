import 'package:component/component.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class GuideThemeInfo extends StatelessWidget {
  final String title;
  final String time;
  final bool isPremium;
  const GuideThemeInfo({
    Key? key,
    required this.title,
    required this.time,
    required this.isPremium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        isPremium ? const PremiumIcon() : const SizedBox.shrink(),
        Text(
          title,
          style: CustomTextStyle.TITLE_14,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          time,
          style: CustomTextStyle.TITLE_12.apply(
            color: StaticColors.place_holder,
          ),
        ),
      ],
    );
  }
}
