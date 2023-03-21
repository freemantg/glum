import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import 'widgets.dart';

class WeekDistributionCard extends ConsumerWidget {
  const WeekDistributionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StyledCard(
      customPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Text('Recent Glums', style: $styles.text.bodySmallBold),
          ),
          Row(
            children: [
              ...List.generate(
                  ref.watch(statsNotifierProvider).weeklyGlum.keys.length,
                  (index) {
                final storyDate = ref
                    .watch(statsNotifierProvider)
                    .weeklyGlum
                    .keys
                    .toList()[index];
                return Expanded(
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 48),
                    decoration: BoxDecoration(
                      color: (ref
                              .watch(statsNotifierProvider)
                              .weeklyGlum[storyDate])!
                          .ratingToColor(),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            storyDate.dateTimeInDayFormat,
                            style: $styles.text.caption
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: $styles.insets.xxs),
                          Text(storyDate.dateTimeInShortDayFormat,
                              style: $styles.text.caption),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
