import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:review_app/review_app.dart';

class FeelingIcon extends StatelessWidget {
  final FeelStatus value;
  final String text;
  final Widget icon;
  final FeelStatus? groupValue;
  final ValueChanged<FeelStatus>? onPressed;

  const FeelingIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
    this.groupValue,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(
        height: 50,
      ),
      IconButton(
        iconSize: 80,
        onPressed: () {
          if (value == groupValue) {
            return;
          }
          onPressed?.call(value);
        },
        icon: icon,
      ),
      Text(
        text,
        style: TextStyle(
          color: value == groupValue
              ? StaticColors.background_feeling
              : Colors.white,
          fontSize: 20,
          fontFamily: 'MontserratSemiBold',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
      ),
    ]);
  }
}
