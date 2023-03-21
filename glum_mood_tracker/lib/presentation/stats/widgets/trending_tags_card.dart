import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import '../../cards/widgets/tag_bottom_modal_sheet.dart';
import 'widgets.dart';

class TrendingTagsCard extends ConsumerWidget {
  const TrendingTagsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingTags = ref.watch(statsNotifierProvider).trendingTags;

    return StyledCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, trendingTags.length),
          SizedBox(height: $styles.insets.sm),
          _buildTagsList(trendingTags),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int tagCount) {
    return Row(
      children: [
        Text('Trending Tags', style: $styles.text.bodySmallBold),
        const Spacer(),
        Text(
          tagCount.toString(),
          style: $styles.text.bodySmallBold.copyWith(height: 0),
        ),
        GestureDetector(
          child: const Icon(Icons.keyboard_arrow_right),
          onTap: () => showTagModalBottomSheet(context),
        ),
      ],
    );
  }

  Widget _buildTagsList(Map<TagModel, int> trendingTags) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: $styles.insets.xs,
      children: trendingTags.entries
          .map((e) => TrendingTagChip(tag: e.key, count: e.value))
          .toList(),
    );
  }
}
