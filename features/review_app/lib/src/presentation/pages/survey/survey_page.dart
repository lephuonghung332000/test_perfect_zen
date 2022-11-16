import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:review_app/review_app.dart';
import 'component/survey_body.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({
    Key? key,
    required this.durationByMin,
  }) : super(key: key);

  final int durationByMin;

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  FeelStatus? feelStatus;

  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>().setCurrentScreen(ScreenName.surveyScreen);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocProvider<ReviewBloc>(
        create: (context) => GetIt.I<ReviewBloc>(),
        child: Scaffold(
          body: SurveyBody(
            durationByMin: widget.durationByMin,
            current: feelStatus,
            onSelect: (status) {
              setState(() {
                feelStatus = status;
              });
            },
          ),
        ),
      ),
    );
  }
}
