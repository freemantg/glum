import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get dateTimeNowInString =>
      DateFormat("d MMM / yy").format(this).toUpperCase();
  String get dateTimeInString => DateFormat('EEEE, d MMM').format(this);
  String get dateTimeInMonthYearString =>
      DateFormat("MMMM yyyy").format(this).toUpperCase();
  String get dateTimeInStoryPageFormat =>
      DateFormat("EE, MMM dd / yyyy").format(this).toUpperCase();
  String get dateTimeInDayFormat => DateFormat("EE").format(this);
}

extension DateTimeDayIndex on int {
  String getDayString() {
    switch (this) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return 'Err';
    }
  }
}
