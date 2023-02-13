import 'package:flutter/material.dart';
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
  String get dateTimeInShortDayFormat =>
      DateFormat("MMM d").format(this).toUpperCase();
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

extension ColorX on int {
  Color ratingToColor() {
    switch (this) {
      case 1:
        return const Color(0xFFD39E32);
      case 2:
        return const Color(0xFFCF6125);
      case 3:
        return const Color(0xFFDB6162);
      case 4:
        return const Color(0xFF96627F);
      case 5:
        return const Color(0xFF26A843);
      default:
        return Colors.black;
    }
  }
}
