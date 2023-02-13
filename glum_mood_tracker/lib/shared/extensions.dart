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
        return 'MON';
      case 2:
        return 'TUE';
      case 3:
        return 'WED';
      case 4:
        return 'THU';
      case 5:
        return 'FRI';
      case 6:
        return 'SAT';
      case 7:
        return 'SUN';
      default:
        return 'ERR';
    }
  }
}
