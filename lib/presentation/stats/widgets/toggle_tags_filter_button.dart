import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import '../../cards/widgets/tag_bottom_modal_sheet.dart';

class ToggleTagsFilterButton extends HookConsumerWidget {
  const ToggleTagsFilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMoodsFilter = useState(true);
    final trendingStats = ref.watch(statsNotifierProvider).trendingStats;
    final insets = $styles.insets; // Extracted for reuse

    return GestureDetector(
      onTap: () {
        isMoodsFilter.value = !isMoodsFilter.value;
        ref
            .read(statsNotifierProvider.notifier)
            .tagsByMoodsOrGlums(isMoodsFilter.value);
      },
      child: Row(
        children: [
          Text(
            'Moods',
            style: $styles.text.bodySmallBold.copyWith(
              color: isMoodsFilter.value
                  ? const Color(0xFFEB5124)
                  : Theme.of(context).disabledColor,
            ),
          ),
          SizedBox(width: insets.xs),
          Text(
            'Glums',
            style: $styles.text.bodySmallBold.copyWith(
              color: !isMoodsFilter.value
                  ? const Color(0xFFEB5124)
                  : Theme.of(context).disabledColor,
            ),
          ),
          const Spacer(),
          Text(
            trendingStats.trendingMoodsOrGlums.keys.length.toString(),
            style: $styles.text.bodySmallBold.copyWith(height: 0),
          ),
          GestureDetector(
            child: const Icon(Icons.keyboard_arrow_right),
            onTap: () => showTagModalBottomSheet(context),
          ),
        ],
      ),
    );
  }
}
