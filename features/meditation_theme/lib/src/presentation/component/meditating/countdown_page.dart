import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';

import 'components/components.dart';

class CountDownPage extends StatelessWidget {
  final MeditationThemeDTO meditationThemeDTO;
  const CountDownPage({
    Key? key,
    required this.meditationThemeDTO,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>()
        .setCurrentScreen(ScreenName.meditationProcessScreen);
    Wakelock.enable();
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Center(
              child: SvgPicture.asset(AssetsPath.icArrowLeftCircle),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0.0,
          backgroundColor: StaticColors.background_begin_gradient,
          title: Text(
            meditationThemeDTO.name,
            style: CustomTextStyle.HEADER_24,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              StaticColors.background_begin_gradient,
              StaticColors.background_end_gradient,
            ],
          )),
          child: Center(
            child: CountdownBody(
              meditationThemeDTO: meditationThemeDTO,
              saveDuration: meditationThemeDTO.duration,
            ),
          ),
        ));
  }
}
