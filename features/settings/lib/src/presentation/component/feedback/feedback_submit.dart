import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

class SubmitBody extends StatelessWidget {
  final VoidCallback? onPressed;

  const SubmitBody({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 350,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            StaticColors.premium_end_gradient,
            StaticColors.premium_begin_gradient,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          S.current.feedback_submit,
          style: CustomTextStyle.TITLE_16.apply(color: Colors.white),
        ),
      ),
    ));
  }
}
