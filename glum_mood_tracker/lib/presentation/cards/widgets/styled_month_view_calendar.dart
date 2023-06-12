import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import 'widgets.dart';

class StyledMonthViewCalendar extends StatelessWidget {
  const StyledMonthViewCalendar({
    Key? key,
    required this.monthYear,
  }) : super(key: key);

  final DateTime monthYear;

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
        DateUtils.getDaysInMonth(monthYear.year, monthYear.month);
    final firstDayOfMonthOffset = DateUtils.firstDayOffset(
      monthYear.year,
      monthYear.month,
      const DefaultMaterialLocalizations(),
    );

    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: firstDayOfMonthOffset + daysInMonth,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (context, index) {
            if (index + 1 > firstDayOfMonthOffset) {
              return DateButton(
                firstDayOfMonthOffset: firstDayOfMonthOffset,
                monthYear: monthYear,
                dateIndex: index,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        SizedBox(height: $styles.insets.sm),
        Text(
          'Select a date to write',
          style: $styles.text.caption.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}
