import 'package:component/component.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:reports/report.dart';
import 'package:settings/settings.dart';

import 'components/report_body.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<SessionMeditationBloc>(context)
            .add(const LoadSessionMeditationEvent());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>().setCurrentScreen(ScreenName.reportScreen);
    return Column(
      children: [
        Expanded(
          child: Scaffold(
            backgroundColor: StaticColors.background_settings,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: StaticColors.background_settings,
              title: Text(
                S.current.navigation_report,
                style: CustomTextStyle.TITLE_20.apply(color: Colors.black87),
              ),
            ),
            body: const ReportBody(),
          ),
        ),
        BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionAvailableState) {
              return Container();
            }

            return const AdBanner();
          },
        ),
      ],
    );
  }
}
