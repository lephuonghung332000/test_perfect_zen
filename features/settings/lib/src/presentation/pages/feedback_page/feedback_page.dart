import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/src/presentation/blocs/blocs.dart';

import 'components/feedback_body.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>().setCurrentScreen(ScreenName.feedbackScreen);
    return Scaffold(
      backgroundColor: StaticColors.background_settings,
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
        backgroundColor: StaticColors.background_settings,
        title: Text(
          S.current.feedback,
          style: CustomTextStyle.TITLE_20.apply(color: Colors.black),
        ),
      ),
      body: BlocProvider.value(
        value: GetIt.I<FeedbackBloc>(),
        child: const FeedBackBody(),
      ),
    );
  }
}
