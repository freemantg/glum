import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/story.dart';
import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import '../../routes/app_router.gr.dart';

class DateButton extends ConsumerWidget {
  const DateButton({
    super.key,
    required this.dateIndex,
    required this.monthYear,
    required this.firstDayOfMonthOffset,
  });

  final int dateIndex;
  final DateTime monthYear;
  final int firstDayOfMonthOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonDay = (dateIndex + 1) - firstDayOfMonthOffset;
    final buttonDate = DateTime(monthYear.year, monthYear.month, buttonDay);

    final story = ref.watch(storiesNotifierProvider).maybeWhen(
          loadSuccess: (stories) {
            return stories.firstWhere(
              (story) => DateUtils.isSameDay(story.date, buttonDate),
              orElse: () => Story.empty().copyWith(date: buttonDate),
            );
          },
          orElse: () => Story.empty(),
        );

    return GestureDetector(
      onTap: () {
        if (story.id == null) {
          context.router.push(AddStoryPageRoute(story: story));
        } else {
          context.router.push(StoryPageRoute(story: story));
        }
      },
      child: Text(
        buttonDay.toString(),
        textAlign: TextAlign.center,
        style: (story.id == null)
            ? $styles.text.bodySmall.copyWith(color: Theme.of(context).disabledColor)
            : $styles.text.bodySmall.copyWith(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
      ),
    );
  }
}
