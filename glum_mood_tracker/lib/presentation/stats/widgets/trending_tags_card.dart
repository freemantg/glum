import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import '../../cards/widgets/tag_bottom_modal_sheet.dart';
import 'widgets.dart';


class TrendingTagsCard extends ConsumerWidget {
  const TrendingTagsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingTags = ref.watch(statsNotifierProvider).trendingTags;

    return StyledCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Trending Tags', style: $styles.text.bodySmallBold),
              const Spacer(),
              Text(
                trendingTags.length.toString(),
                style: $styles.text.bodySmallBold.copyWith(height: 0),
              ),
              GestureDetector(
                child: const Icon(Icons.keyboard_arrow_right),
                onTap: () => showTagModalBottomSheet(context),
              )
            ],
          ),
          SizedBox(height: $styles.insets.sm),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: $styles.insets.xs,
            children: trendingTags.entries
                .map((e) => TrendingTagChip(
                      tag: e.key,
                      count: e.value,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
