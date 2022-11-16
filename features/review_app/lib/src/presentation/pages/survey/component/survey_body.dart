import 'package:component/atom/atom.dart';
import 'package:component/atom/review_us.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:reports/report.dart';
import 'package:review_app/review_app.dart';
import '../../../../analytics/analytics.dart';
import 'submit_page.dart';
import 'survey_feeling.dart';
import 'package:settings/settings.dart';

class SurveyBody extends StatefulWidget {
  final ValueChanged<FeelStatus>? onSelect;
  final FeelStatus? current;
  final int durationByMin;

  const SurveyBody({
    required this.durationByMin,
    this.current,
    this.onSelect,
    Key? key,
  }) : super(key: key);

  @override
  State<SurveyBody> createState() => _SurveyBodyState();
}

class _SurveyBodyState extends State<SurveyBody> {
  late bool isAvailableTransaction;

  @override
  void initState() {
    isAvailableTransaction = false;
    BlocProvider.of<TransactionBloc>(Routes.navigatorStateKey.currentContext!)
        .add(GetCurrentTransactionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, transactionState) =>
          BlocListener<ReviewBloc, ReviewState>(
        listener: ((context, state) {
          if (state is ShowReview) {
            context.showRateUse();
          }
        }),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              StaticColors.background_begin_gradient,
              StaticColors.background_end_gradient,
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Text(
                    S.current.feeling_message,
                    style: CustomTextStyle.HEADER_24.apply(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                _iconFeeling(),
                const SizedBox(
                  height: 100,
                ),
                BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) {
                    FeelStatus? status;

                    if (state is SelectedStatusState) {
                      status = state.status;
                    }

                    return status != null
                        ? SubmitPage(
                            onPressed: () {
                              GetIt.I<SessionMeditationBloc>().add(
                                AddSessionMeditationEvent(
                                  duration: widget.durationByMin,
                                  onSuccess: () {
                                    if (status != null) {
                                      GetIt.I<AnalyticsHelper>().logEvent(
                                        status.analyticsEvent,
                                      );
                                    }
                                    BlocProvider.of<SessionMeditationBloc>(
                                            context)
                                        .add(
                                            const LoadSessionMeditationEvent());
                                  },
                                ),
                              );
                              context
                                  .read<ReviewBloc>()
                                  .add(const SendReviewEvent());
                              if (transactionState
                                  is TransactionAvailableState) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainPage(),
                                  ),
                                );
                              } else {
                                GetIt.I<AdHelper>().showInterstitialAd(
                                    onDimissed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainPage(),
                                    ),
                                  );
                                });
                              }
                              Toast.show(message: S.current.survey_toast);
                            },
                            durationByMin: widget.durationByMin,
                          )
                        : const SubmitPageFace();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconFeeling() {
    return BlocBuilder<ReviewBloc, ReviewState>(
      buildWhen: (previous, current) =>
          current is InitState || current is SelectedStatusState,
      builder: (context, state) {
        FeelStatus? status;
        if (state is SelectedStatusState) {
          status = state.status;
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FeelingIcon(
                  icon: SvgPicture.asset(
                    AssetsPath.happy,
                    color: status == FeelStatus.excited
                        ? StaticColors.background_feeling
                        : Colors.white,
                  ),
                  onPressed: (status) {
                    context.read<ReviewBloc>().add(SelectedStatusEvent(status));
                  },
                  value: FeelStatus.excited,
                  groupValue: status,
                  text: S.current.feeling_excited,
                ),
                const SizedBox(
                  width: 50,
                ),
                FeelingIcon(
                  icon: SvgPicture.asset(
                    AssetsPath.cheerful,
                    color: status == FeelStatus.happy
                        ? StaticColors.background_feeling
                        : Colors.white,
                  ),
                  onPressed: (status) {
                    context.read<ReviewBloc>().add(SelectedStatusEvent(status));
                  },
                  value: FeelStatus.happy,
                  groupValue: status,
                  text: S.current.feeling_happy,
                ),
              ],
            ),
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FeelingIcon(
                    icon: SvgPicture.asset(
                      AssetsPath.speechless,
                      color: status == FeelStatus.normal
                          ? StaticColors.background_feeling
                          : Colors.white,
                    ),
                    value: FeelStatus.normal,
                    groupValue: status,
                    onPressed: (status) {
                      context
                          .read<ReviewBloc>()
                          .add(SelectedStatusEvent(status));
                    },
                    text: S.current.feeling_normal,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  FeelingIcon(
                    icon: SvgPicture.asset(
                      AssetsPath.depress,
                      color: status == FeelStatus.sad
                          ? StaticColors.background_feeling
                          : Colors.white,
                    ),
                    onPressed: (status) {
                      context
                          .read<ReviewBloc>()
                          .add(SelectedStatusEvent(status));
                    },
                    value: FeelStatus.sad,
                    groupValue: status,
                    text: S.current.feeling_sad,
                  )
                ])
              ],
            )
          ],
        );
      },
    );
  }
}

class SubmitPageFace extends StatelessWidget {
  const SubmitPageFace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: StaticColors.black5,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              S.current.survey_send,
              style: CustomTextStyle.WHITE_BUTTON_18,
            ),
          ),
        )
      ],
    );
  }
}

extension FeedStatusExtension on FeelStatus {
  String get type {
    switch (this) {
      case FeelStatus.sad:
        return 'negative';
      case FeelStatus.happy:
        return 'neutral';
      case FeelStatus.normal:
        return 'neutral';
      case FeelStatus.excited:
        return 'positive';
    }
  }

  AnalyticsEvent get analyticsEvent {
    switch (this) {
      case FeelStatus.excited:
        return MeditationSurveyEvent.excited;
      case FeelStatus.happy:
        return MeditationSurveyEvent.happy;
      case FeelStatus.normal:
        return MeditationSurveyEvent.normal;
      case FeelStatus.sad:
        return MeditationSurveyEvent.sad;
    }
  }
}
