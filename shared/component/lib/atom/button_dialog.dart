import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

enum ActionButtonStyle { empty, filled }

class ButtonDialog extends StatelessWidget {
  final String text;
  final ActionButtonStyle style;
  final void Function() onPressed;
  final bool disable;

  const ButtonDialog({
    Key? key,
    required this.text,
    required this.style,
    required this.onPressed,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: disable
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            )
          : (style == ActionButtonStyle.filled
              ? BoxDecoration(
                  color: StaticColors.active_duration,
                  borderRadius: BorderRadius.circular(16),
                )
              : null),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          shape: style == ActionButtonStyle.filled
              ? null
              : MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: const BorderSide(color: StaticColors.active_duration),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
          minimumSize: MaterialStateProperty.all(
            const Size(100.0, 40.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: CustomTextStyle.TITLE_14.apply(
              color:
                  style == ActionButtonStyle.filled ? Colors.white : StaticColors.active_duration),
        ),
      ),
    );
  }
}
