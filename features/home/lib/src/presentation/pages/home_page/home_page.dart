import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/settings.dart';

import '../../../../home.dart';
import '../../blocs/main/first_time_event.dart';
import '../../blocs/main/first_time_state.dart';
import 'components/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final _keyHomeAndTheme = GlobalKey();
  OverlayEntry? tutorial;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<FirstTimeBloc>(context).add(OpenAppEvent());

        BlocProvider.of<TransactionBloc>(context)
            .add(GetCurrentTransactionEvent());

        BlocProvider.of<MeditationThemeBloc>(context)
            .add(const LoadMeditationThemeEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>().setCurrentScreen(ScreenName.homeScreen);
    return BlocListener<FirstTimeBloc, FirstTimeState>(
      listener: (context, state) {
        if (state is ShowingTutorialState) {
          final detailHomeAndTheme = _keyHomeAndTheme.detail;

          if (detailHomeAndTheme == null) {
            return;
          }

          tutorial = TutorialPopup.show(
            context,
            detailHomeAndTheme: detailHomeAndTheme,
            onTap: () {
              GetIt.I<AnalyticsHelper>().logEvent(
                  CommontAnalyticsEvent(EventName.tutorialImpression));
              BlocProvider.of<FirstTimeBloc>(context).add(DoneFirstTimeEvent());
              tutorial?.remove();
            },
          );
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                StaticColors.background_begin_gradient,
                StaticColors.background_end_gradient,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Center(
            child: HomeBody(
              homeAndThemBtn: _keyHomeAndTheme,
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
