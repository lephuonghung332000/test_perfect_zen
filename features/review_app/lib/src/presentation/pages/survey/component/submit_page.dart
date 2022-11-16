import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class SubmitPage extends StatelessWidget {
  final VoidCallback? onPressed;
  const SubmitPage({
    Key? key,
    required this.durationByMin,
    this.onPressed,
  }) : super(key: key);
  final int durationByMin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                StaticColors.background_begin_submit,
                StaticColors.background_end_submit,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              S.current.survey_submit,
              style: CustomTextStyle.WHITE_BUTTON_18,
            ),
          ),
        )
      ],
    );
  }
}
