import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import 'widgets.dart';

class TagsDistributionCard extends ConsumerWidget {
  const TagsDistributionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingTags =
        ref.watch(statsNotifierProvider).trendingStats.trendingMoodsOrGlums;
    final insets = $styles.insets;

    return StyledCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ToggleTagsFilterButton(),
          SizedBox(height: insets.sm),
          Wrap(
            spacing: insets.xs,
            children: trendingTags.entries
                .map((e) => TrendingTagChip(
                      tag: e.key,
                      count: e.value,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
