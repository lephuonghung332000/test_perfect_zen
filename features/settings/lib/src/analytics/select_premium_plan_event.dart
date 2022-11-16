import 'package:core/core.dart';

class SelectPremiumPlanEvent extends AnalyticsEvent {
  final String value;

  SelectPremiumPlanEvent(this.value) : super('select_premium_plan');

  @override
  Map<String, Object?>? getParams() {
    return {'premium': value};
  }
}
