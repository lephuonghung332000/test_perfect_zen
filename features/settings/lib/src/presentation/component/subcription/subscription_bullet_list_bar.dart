import 'package:component/component.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class SubscriptionBulletListBar extends StatelessWidget {
  const SubscriptionBulletListBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.title_bullet_list,
          style: CustomTextStyle.TITLE_16.apply(
            color: StaticColors.purple_upgrade_plan,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 18,
        ),
        BulletList(
          [
            S.current.describe_plan_1,
            S.current.describe_plan_2,
            S.current.describe_plan_3,
            S.current.describe_plan_4,
            S.current.describe_plan_5,
            S.current.describe_plan_6,
          ],
        ),
      ],
    );
  }
}
