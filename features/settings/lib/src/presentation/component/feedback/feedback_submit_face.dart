import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

class SubmitFaceBody extends StatelessWidget {
  const SubmitFaceBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: StaticColors.black5,
        ),
        child: Center(
          child: Text(
            S.current.feedback_submit,
            style: CustomTextStyle.TITLE_16.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
