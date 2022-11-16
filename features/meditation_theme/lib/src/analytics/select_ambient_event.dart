import 'package:core/core.dart';

class SelectAmbientEvent extends AnalyticsEvent {
  final String value;

  SelectAmbientEvent(this.value) : super('select_ambient');

  @override
  Map<String, Object?>? getParams() {
    return {'ambient': value};
  }
}
