import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.current.home_title,
      style: CustomTextStyle.WHITE_HEADER_24,
    );
  }
}
