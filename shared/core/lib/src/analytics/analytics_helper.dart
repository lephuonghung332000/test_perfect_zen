import 'package:dependencies/dependencies.dart';

class AnalyticsHelper {
  void logEvent(AnalyticsEvent event) {
    FirebaseAnalytics.instance.logEvent(
      name: event.name,
      parameters: event.getParams(),
    );
  }

  void logEvents(List<AnalyticsEvent> events) {
    for (final event in events) {
      FirebaseAnalytics.instance.logEvent(
        name: event.name,
        parameters: event.getParams(),
      );
    }
  }

  void setCurrentScreen(String screenName) {
    FirebaseAnalytics.instance.setCurrentScreen(screenName: screenName);
  }
}

abstract class AnalyticsEvent {
  final String name;

  const AnalyticsEvent(this.name);

  Map<String, Object?>? getParams();
}

class CommontAnalyticsEvent extends AnalyticsEvent {
  CommontAnalyticsEvent(super.name);

  @override
  Map<String, Object?>? getParams() {
    return null;
  }
}
