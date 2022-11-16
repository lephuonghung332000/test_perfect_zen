import 'package:core/core.dart';

class MeditationSurveyEvent extends AnalyticsEvent {
  final String value;

  MeditationSurveyEvent(this.value) : super('meditation_survey');

  static MeditationSurveyEvent excited = MeditationSurveyEvent('excited');
  static MeditationSurveyEvent happy = MeditationSurveyEvent('happy');
  static MeditationSurveyEvent normal = MeditationSurveyEvent('normal');
  static MeditationSurveyEvent sad = MeditationSurveyEvent('sad');

  @override
  Map<String, Object?>? getParams() {
    return {'feelings': value};
  }
}
