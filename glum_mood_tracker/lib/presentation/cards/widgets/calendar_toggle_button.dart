import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../styles/styles.dart';

class CalendarToggleButton extends HookWidget {
  const CalendarToggleButton({
    super.key,
    required this.showCalendar,
    required this.toggleCalendar,
  });

  final bool showCalendar;
  final void Function() toggleCalendar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCalendar,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: $styles.insets.xs,
          horizontal: $styles.insets.lg,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white12),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular($styles.corners.lg),
        ),
        child: Text(
          showCalendar ? 'MONTH' : 'CALENDAR',
          style: $styles.text.caption.copyWith(height: 0),
        ),
      ),
    );
  }
}
