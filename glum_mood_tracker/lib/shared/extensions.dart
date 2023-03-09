import 'package:flutter/material.dart';
import 'package:glum_mood_tracker/styles/colors.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get dateTimeNowInString =>
      DateFormat("MMM d. yy").format(this).toUpperCase();
  String get dateTimeInString => DateFormat('EEEE, d MMM').format(this);
  String get dateTimeInMonthYearString => DateFormat("MMMM yyyy").format(this);
  String get dateTimeInStoryPageFormat =>
      DateFormat("EE, MMMM d. yyyy").format(this);
  String get dateTimeInDayFormat => DateFormat("EE").format(this);
  String get dateTimeInDayLongFormat => DateFormat("EEEE").format(this);
  String get dateTimeInShortDayFormat => DateFormat("MMM d").format(this);
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
        return colors[1];
      case 2:
        return colors[2];
      case 3:
        return colors[3];
      case 4:
        return colors[4];
      case 5:
        return colors[5];
      default:
        return Colors.transparent;
    }
  }
}

extension LabelX on int {
  String ratingToLabel() {
    switch (this) {
      case 1:
        return "Despair";
      case 2:
        return "Gloomy";
      case 3:
        return "So-So";
      case 4:
        return "Glimmer";
      case 5:
        return "Light";
      default:
        return "Error";
    }
  }
}
