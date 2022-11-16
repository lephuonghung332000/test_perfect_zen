import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

enum PremiumType {
  bestValue,
  mostPopular;

  String get title {
    switch (this) {
      case PremiumType.bestValue:
        return S.current.best_value;
      case PremiumType.mostPopular:
        return S.current.most_popular;
    }
  }
}

class SubscriptionPremiumBadge extends StatelessWidget {
  final PremiumType type;
  const SubscriptionPremiumBadge({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        gradient: LinearGradient(
          colors: [
            StaticColors.premium_begin_gradient,
            StaticColors.premium_end_gradient,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Text(type.title, style: CustomTextStyle.WHITE_BODY_11),
    );
  }
}
