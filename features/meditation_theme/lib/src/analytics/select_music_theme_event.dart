import 'package:core/core.dart';

class SelectMusicThemeEvent extends AnalyticsEvent {
  final String value;

  SelectMusicThemeEvent(this.value) : super('select_music');

  @override
  Map<String, Object?>? getParams() {
    return {'music': value};
  }
}
