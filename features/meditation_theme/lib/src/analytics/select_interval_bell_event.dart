import 'package:core/core.dart';

class SelectIntervalBellEvent extends AnalyticsEvent {
  final String value;

  SelectIntervalBellEvent(this.value) : super('select_interval_bell');

  @override
  Map<String, Object?>? getParams() {
    return {'intervalbell': value};
  }
}
