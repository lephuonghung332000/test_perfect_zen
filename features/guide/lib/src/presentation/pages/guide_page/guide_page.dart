import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/settings.dart';

import '../../../../guide.dart';
import 'components/guide_body.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<MeditationThemeBloc>(context)
            .add(const LoadMeditationThemeEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>().setCurrentScreen(ScreenName.guideScreen);
    return Scaffold(
      backgroundColor: StaticColors.add_theme_background_purple,
      appBar: AppBar(
        backgroundColor: StaticColors.add_theme_background_purple,
        elevation: 0.0,
        title: Text(
          S.current.navigation_guide,
          style: CustomTextStyle.TITLE_16.apply(color: Colors.black),
        ),
      ),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) => GuideBody(
          listMusic: MusicEntity.mocks(),
          transactionAvailable: state is TransactionAvailableState,
        ),
      ),
    );
  }
}
