import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import 'widgets.dart';

class StoryCountCard extends ConsumerWidget {
  const StoryCountCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(statsNotifierProvider).storyStats;
    final insets = $styles.insets; // Extracted for reuse

    return StyledCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                stats.allStoriesCount.toString(),
                style: $styles.text.bodyBold.copyWith(
                  height: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: insets.xxs),
              Text(
                'All Stories',
                style: $styles.text.caption.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                stats.glumAverage.toStringAsFixed(2),
                style: $styles.text.bodyBold.copyWith(
                  height: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: insets.xxs),
              Text(
                'Glum Average',
                style: $styles.text.caption.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
