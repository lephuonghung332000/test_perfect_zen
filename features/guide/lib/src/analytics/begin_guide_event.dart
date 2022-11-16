import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class BeginGuideEvent extends AnalyticsEvent {
  final String value;

  BeginGuideEvent(this.value) : super('begin_guide');

  factory BeginGuideEvent.fromTitle(String guide) {
    final Map<String, String> listValues = {
      "'How to Meditate' for Beginners | Sadhguru": 'Sadhguru',
      "Calm - Ease | Guided Meditation by Thich Nhat Hanh": "Thich Nhat Hanh",
      "5 Minute Guided Morning Meditation for Positive Energy":
          "Positive Energy",
      "5-Minute Guided Meditation: Morning Energy": "Morning Energy",
      "15 Min Guided Meditation For Healing & Recovery": "Healing",
      "Connect to HIGHER SELF Guided Meditation | Hypnosis for Meeting your Higher Self":
          "Higher Self",
    };

    final key = listValues.keys.firstWhereOrNull((element) => element == guide);

    if (key != null) {
      return BeginGuideEvent(listValues[key]!);
    }

    return BeginGuideEvent(guide);
  }

  @override
  Map<String, Object?>? getParams() {
    return {'guide': value};
  }
}
