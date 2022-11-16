import 'package:dependencies/dependencies.dart';

abstract class DateFormats {
  static const String yearMonthDay = 'yyyy-MM-dd HH:mm:ss';
  static const monthYear = 'MMM yyyy';
}

abstract class DateFormatter {
  static DateTime yearMonthDay(String date, {bool utc = false}) {
    return DateFormat(DateFormats.yearMonthDay).parse(date, utc);
  }

  static String monthYear(DateTime date) {
    return DateFormat(DateFormats.monthYear).format(date);
  }
}
