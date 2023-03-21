import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import '../../cards/widgets/tag_bottom_modal_sheet.dart';

class ToggleTagsFilterButton extends HookConsumerWidget {
  const ToggleTagsFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isMoodsFilter = useState(true);

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
                  ? const Color(0xFFD76A66)
                  : Theme.of(context).disabledColor,
            ),
          ),
          SizedBox(width: $styles.insets.xs),
          Text(
            'Glums',
            style: $styles.text.bodySmallBold.copyWith(
              color: !isMoodsFilter.value
                  ? const Color(0xFFD76A66)
                  : Theme.of(context).disabledColor,
            ),
          ),
          const Spacer(),
          Text(
            ref
                .watch(statsNotifierProvider)
                .trendingMoodsOrGlums
                .keys
                .length
                .toString(),
            style: $styles.text.bodySmallBold.copyWith(height: 0),
          ),
          GestureDetector(
            child: const Icon(Icons.keyboard_arrow_right),
            onTap: () => showTagModalBottomSheet(context),
          )
        ],
      ),
    );
  }
}
