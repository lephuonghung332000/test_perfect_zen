import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class SubscriptionListProduct extends StatelessWidget {
  final String title;
  final Widget child;
  const SubscriptionListProduct(
      {Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyle.TITLE_16.apply(
            color: StaticColors.purple_upgrade_plan,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: child,
        )
      ],
    );
  }
}
