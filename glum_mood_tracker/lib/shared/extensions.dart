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
