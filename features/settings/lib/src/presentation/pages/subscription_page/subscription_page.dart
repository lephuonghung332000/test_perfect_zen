import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

import '../../../../settings.dart';
import 'components/subscription_body.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>()
        .setCurrentScreen(ScreenName.upgradePremiumPlanScreen);
    return Scaffold(
      backgroundColor: StaticColors.add_theme_background_purple,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(AssetsPath.icArrowLeftCircle),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: StaticColors.add_theme_background_purple,
        elevation: 0.0,
        title: Text(
          S.current.upgrade_premium_plan,
          style: CustomTextStyle.TITLE_16.apply(color: Colors.black),
        ),
      ),
      body: BlocProvider<SubscriptionBloc>.value(
        value: GetIt.I<SubscriptionBloc>(),
        child: const SafeArea(
          child: SubscriptionBody(),
        ),
      ),
    );
  }
}
