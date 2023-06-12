import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/models.dart';
import '../../../styles/styles.dart';
import '../../routes/app_router.dart';
import 'widgets.dart';

class MonthCard extends ConsumerWidget {
  const MonthCard({
    Key? key,
    required this.showCalendar,
    required this.card,
    required this.monthYear,
  }) : super(key: key);

  final bool showCalendar;
  final CardModel? card;
  final DateTime monthYear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.router.push(MonthRoute(monthYear: monthYear)),
      child: Card(
        color: card?.color,
        elevation: 0,
        margin: EdgeInsets.all($styles.insets.sm),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular($styles.corners.md),
        ),
        child: Stack(
          children: [
            if (!showCalendar && card?.photo?.file != null)
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular($styles.corners.md),
                  child: Image.file(
                    card!.photo!.file!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                $styles.insets.sm,
                $styles.insets.md,
                $styles.insets.sm,
                $styles.insets.sm,
              ),
              child: Column(
                crossAxisAlignment: showCalendar
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        monthYear.month.toString(),
                        style: $styles.text.h1,
                      ),
                      Text(
                        DateFormat.MMM()
                            .format(DateTime(monthYear.year, monthYear.month))
                            .toUpperCase(),
                        style: $styles.text.h3.copyWith(
                          height: 0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (showCalendar)
                    StyledMonthViewCalendar(monthYear: monthYear)
                  else
                    MonthProgressBar(monthYear: monthYear),
                  if (!showCalendar) const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
