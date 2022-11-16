import 'package:core/core.dart';
import 'package:component/component.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:guide/guide.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:reports/report.dart';

import '../../../home.dart';
import '../presentation.dart';
import 'package:settings/settings.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late BottomNavBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<BottomNavBloc>(context);
    GetIt.I<AdHelper>().createInterstitialAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(state),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, state) {
        switch (state) {
          case 0:
            GetIt.I<AnalyticsHelper>()
                .logEvent(CommontAnalyticsEvent(EventName.viewTheme));
            return const HomePage();

          case 1:
            return WillPopScope(
              onWillPop: () async {
                _bloc.add(ChangeBottomNavEvent(index: 0));
                return false;
              },
              child: const GuidePage(),
            );
          case 2:
            GetIt.I<AnalyticsHelper>()
                .logEvent(CommontAnalyticsEvent(EventName.viewReport));
            return WillPopScope(
              onWillPop: () async {
                _bloc.add(ChangeBottomNavEvent(index: 0));
                return false;
              },
              child: const ReportPage(),
            );
          case 3:
            GetIt.I<AnalyticsHelper>()
                .logEvent(CommontAnalyticsEvent(EventName.viewSetting));
            return WillPopScope(
              onWillPop: () async {
                _bloc.add(ChangeBottomNavEvent(index: 0));
                return false;
              },
              child: const SettingsPage(),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _buildBottomNav(int currentIndex) {
    return BottomNavigationBar(
      backgroundColor: StaticColors.add_theme_background_purple,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (v) {
        _bloc.add(ChangeBottomNavEvent(index: v));
      },
      selectedFontSize: Dimens.dp14,
      unselectedFontSize: Dimens.dp14,
      selectedItemColor: StaticColors.premium_begin_gradient,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetsPath.homeNavigationOFF,
              width: Dimens.dp22, height: Dimens.dp22),
          activeIcon: SvgPicture.asset(AssetsPath.homeNavigationON,
              width: Dimens.dp22, height: Dimens.dp22),
          label: S.current.navigation_home,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetsPath.guideNavigationOFF,
              width: Dimens.dp22, height: Dimens.dp22),
          activeIcon: SvgPicture.asset(AssetsPath.guideNavigationON,
              width: Dimens.dp22, height: Dimens.dp22),
          label: S.current.navigation_guide,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetsPath.reportNavigationOFF,
              width: Dimens.dp22, height: Dimens.dp22),
          activeIcon: SvgPicture.asset(AssetsPath.reportNavigationON,
              width: Dimens.dp22, height: Dimens.dp22),
          label: S.current.navigation_report,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetsPath.settingNavigationOFF,
              width: Dimens.dp22, height: Dimens.dp22),
          activeIcon: SvgPicture.asset(AssetsPath.settingNavigationON,
              width: Dimens.dp22, height: Dimens.dp22),
          label: S.current.navigation_setting,
        ),
      ],
    );
  }
}
