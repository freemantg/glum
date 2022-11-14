import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get dateTimeNowInString => DateFormat("MMM, d / y").format(this);
}
