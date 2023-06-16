import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import 'widgets.dart';

class WeekDistributionCard extends ConsumerWidget {
  const WeekDistributionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StyledCard(
      customPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildGlumDistributionRow(ref),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: Text('Recent Glums', style: $styles.text.bodySmallBold),
    );
  }

  Widget _buildGlumDistributionRow(WidgetRef ref) {
    return Row(
      children: List.generate(
        ref.watch(statsNotifierProvider).storyStats.weeklyGlum.keys.length,
        (index) => _buildGlumDistributionColumn(index, ref),
      ),
    );
  }

  Widget _buildGlumDistributionColumn(int index, WidgetRef ref) {
    final storyDate =
        ref.watch(statsNotifierProvider).storyStats.weeklyGlum.keys.toList()[index];
    final glumRating = ref.watch(statsNotifierProvider).storyStats.weeklyGlum[storyDate]!;

    return Expanded(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 48),
        decoration: BoxDecoration(color: glumRating.ratingToColor()),
        child: _buildGlumInfo(storyDate),
      ),
    );
  }

  Widget _buildGlumInfo(DateTime storyDate) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            storyDate.dateTimeInDayFormat,
            style: $styles.text.caption.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: $styles.insets.xxs),
          Text(
            storyDate.dateTimeInShortDayFormat,
            style: $styles.text.caption,
          ),
        ],
      ),
    );
  }
}