import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/src/presentation/component/subscription/subscription_premium_badge.dart';
import 'package:settings/src/presentation/component/subscription/subscription_save_up_to_bar.dart';

import '../../../domain/domain.dart';

class SubscriptionPlanBar extends StatelessWidget {
  final VoidCallback? onClick;
  final bool selected;
  final PurchaseProduct purchaseProduct;

  const SubscriptionPlanBar({
    Key? key,
    this.onClick,
    this.selected = false,
    required this.purchaseProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: selected
              ? Border.all(color: StaticColors.purple_upgrade_plan, width: 2)
              : Border.all(color: Colors.white),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showPremiumBadge(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  purchaseProduct.nameProduct,
                  style: CustomTextStyle.TITLE_16.apply(
                    color: Colors.black,
                  ),
                ),
                Text(
                  purchaseProduct.price,
                  style: CustomTextStyle.TITLE_16.apply(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            showSaveUpTo()
          ],
        ),
      ),
    );
  }

  Widget showPremiumBadge() {
    return purchaseProduct.nameProduct == '3 MONTHS'
        ? Container()
        : SubscriptionPremiumBadge(
            type: purchaseProduct.nameProduct == 'ANNUALLY'
                ? PremiumType.bestValue
                : PremiumType.mostPopular,
          );
  }

  Widget showSaveUpTo() {
    return purchaseProduct.nameProduct == 'MONTHLY'
        ? Container()
        : SubscriptionSaveUpToBar(
            type: purchaseProduct.nameProduct == 'ANNUALLY'
                ? SaveUpType.saveUpTo30PerYear
                : SaveUpType.save10Per3Month,
          );
  }
}
