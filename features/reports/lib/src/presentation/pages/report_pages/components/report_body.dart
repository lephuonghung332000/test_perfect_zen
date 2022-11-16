import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:reports/report.dart';

class ReportBody extends StatelessWidget {
  const ReportBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const SizedBox(
        height: 30,
      ),
      BlocBuilder<SessionMeditationBloc, SessionMeditationState>(
        buildWhen: (previous, current) =>
            current is GetTimesSessionMeditationState,
        builder: (context, state) {
          if (state is GetTimesSessionMeditationState) {
            return RichText(
              text: TextSpan(children: [
                WidgetSpan(
                  child: SvgPicture.asset(
                    AssetsPath.homeNavigationOFF,
                    color: StaticColors.meditating_feeling,
                  ),
                ),
                TextSpan(
                  text: S.current.report_message_1,
                  style: CustomTextStyle.BODY_14.apply(color: Colors.black54),
                ),
                TextSpan(
                  text:
                      ' ${state.consecutiveness > 0 ? state.consecutiveness - 1 : 0} - ${S.current.day} ',
                  style: CustomTextStyle.TITLE_16
                      .apply(color: StaticColors.meditating_feeling),
                ),
                TextSpan(
                  text: S.current.report_message_2,
                  style: CustomTextStyle.BODY_14.apply(color: Colors.black54),
                )
              ]),
            );
          }

          return const SizedBox.shrink();
        },
      ),
      const SizedBox(
        height: 50,
      ),
      const ReportChart()
    ]);
  }
}
