import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class SubscriptionSubscribedBar extends StatelessWidget {
  final DateTime purchaseDate;

  const SubscriptionSubscribedBar({
    Key? key,
    required this.purchaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          top: 7.0,
          right: 8.0,
          bottom: 7.0,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AssetsPath.icCheckCircle,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              S.current.subscribed_plan(DateFormatter.monthYear(purchaseDate)),
              style: CustomTextStyle.TITLE_12.apply(
                color: StaticColors.item_color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
