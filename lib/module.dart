import 'package:core/core.dart';
import 'package:home/home.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:reports/report.dart';
import 'package:review_app/review_app.dart';
import 'package:settings/settings.dart';

List<BaseModule> appModules = [
  HomeFactory().create(),
  SettingModule(),
  ReportModule(),
  MeditationThemeModule(),
  ReviewModule(),
];
