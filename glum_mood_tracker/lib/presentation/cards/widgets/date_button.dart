import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/models.dart';
import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import '../../routes/app_router.dart';

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

    final story = ref.watch(storyNotifierProvider).maybeWhen(
          loadSuccess: (stories) {
            return stories.firstWhere(
              (story) => DateUtils.isSameDay(story.date, buttonDate),
              orElse: () => StoryModel.empty().copyWith(date: buttonDate),
            );
          },
          orElse: () => StoryModel.empty(),
        );

    return GestureDetector(
      onTap: () {
        if (story.id == null) {
          context.router.push(AddStoryRoute(story: story));
        } else {
          context.router.push(StoryRoute(story: story));
        }
      },
      child: Text(
        buttonDay.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color:
              story.id == null ? Theme.of(context).disabledColor : Colors.pink,
          fontWeight: story.id == null ? FontWeight.normal : FontWeight.bold,
          fontSize: $styles.text.bodySmall.fontSize,
        ),
      ),
    );
  }
}
