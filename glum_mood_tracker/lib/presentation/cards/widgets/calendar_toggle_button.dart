import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

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
        padding: EdgeInsets.all($styles.insets.xs),
        decoration: BoxDecoration(
          color: Colors.white70.withOpacity(0.05),
          shape: BoxShape.circle,
        ),
        child: Icon(
          showCalendar ? Icons.undo : Icons.calendar_month_outlined,
          // style: $styles.text.caption.copyWith(height: 0),
        ),
      ),
    );
  }
}
