import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

enum SaveUpType {
  saveUpTo30PerYear,
  save10Per3Month;

  String get title {
    switch (this) {
      case SaveUpType.saveUpTo30PerYear:
        return S.current.save_up_to_30_per_year;
      case SaveUpType.save10Per3Month:
        return S.current.save_10_per_3_months;
    }
  }
}

class SubscriptionSaveUpToBar extends StatelessWidget {
  final SaveUpType type;
  const SubscriptionSaveUpToBar({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Text(
        type.title,
        style: CustomTextStyle.TITLE_12.apply(
          color: StaticColors.white,
        ),
      ),
    );
  }
}
