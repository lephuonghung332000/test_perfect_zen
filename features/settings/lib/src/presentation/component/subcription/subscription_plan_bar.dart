import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/src/presentation/component/subcription/subscription_premium_package_bar.dart';

class SubscriptionPlanBar extends StatelessWidget {
  final String product;
  final String price;
  final VoidCallback? onClick;
  final bool selected;
  final ProductDetails productDetails;
  final bool? isShowPremiumPackage;

  const SubscriptionPlanBar({
    Key? key,
    required this.price,
    required this.product,
    this.onClick,
    this.selected = false,
    required this.productDetails,
    this.isShowPremiumPackage,
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showPremiumPackage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product,
                  style: CustomTextStyle.TITLE_16.apply(
                    color: Colors.black,
                  ),
                ),
                Text(
                  price,
                  style: CustomTextStyle.TITLE_16.apply(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget showPremiumPackage() {
    if (productDetails.id.contains('perfectzen.three.months')) {
      return const SizedBox.shrink();
    }

    return SubscriptionPremiumPackage(
      type: productDetails.id.contains('perfectzen.annually')
          ? PremiumType.bestValue
          : PremiumType.mostPopular,
    );
  }
}
