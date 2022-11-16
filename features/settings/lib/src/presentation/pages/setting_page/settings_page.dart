import 'package:component/component.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/settings.dart';

import 'components/settings_body.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>().setCurrentScreen(ScreenName.settingScreen);
    return Column(
      children: [
        Expanded(
          child: Scaffold(
            backgroundColor: StaticColors.background_settings,
            appBar: AppBar(
              elevation: 0.0,
              automaticallyImplyLeading: false,
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: StaticColors.background_settings,
              title: Text(
                S.current.navigation_setting,
                style: CustomTextStyle.HEADER_24.apply(color: Colors.black87),
              ),
            ),
            body: const SettingsBody(),
          ),
        ),
        BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionAvailableState) {
              return const SizedBox.shrink();
            }

            return const AdBanner();
          },
        ),
      ],
    );
  }
}
