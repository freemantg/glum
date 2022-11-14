import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get dateTimeNowInString => DateFormat("d MMM, yy").format(this);
}
