import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import 'widgets.dart';

class MonthProgressBar extends ConsumerWidget {
  final DateTime monthYear;
  const MonthProgressBar({
    super.key,
    required this.monthYear,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daysInMonth =
        DateUtils.getDaysInMonth(monthYear.year, monthYear.month);

    final stories = ref.watch(storyNotifierProvider).maybeWhen(
          loadSuccess: (stories) {
            return stories
                .where((story) => DateUtils.isSameMonth(story.date, monthYear))
                .length;
          },
          orElse: () => 0,
        );

    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular($styles.corners.sm),
            child: LinearProgressIndicator(
              value: stories / daysInMonth,
              backgroundColor: Colors.white70.withOpacity(0.25),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
        SizedBox(width: $styles.insets.xs),
        Text(
          '$stories',
          style: $styles.text.caption.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '/$daysInMonth',
          style: $styles.text.caption.copyWith(fontWeight: FontWeight.w300),
        ),
        const Spacer(),
        const CardVisualOptionsButton(),
      ],
    );
  }
}
