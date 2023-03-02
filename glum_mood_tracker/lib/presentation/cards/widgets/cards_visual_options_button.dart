import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/shared/providers.dart';

import '../../../styles/colors.dart';
import '../../../styles/styles.dart';

class CardVisualOptionsButton extends ConsumerWidget {
  const CardVisualOptionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: const Icon(Icons.more_horiz),
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular($styles.corners.md)),
        ),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: $styles.insets.md,
              vertical: $styles.insets.xs,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'PHOTO',
                      style: $styles.text.bodySmallBold,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right),
                    )
                  ],
                ),
                const Divider(),
                SizedBox(height: $styles.insets.xs),
                Text(
                  'COLOUR',
                  style: $styles.text.bodySmallBold,
                ),
                SizedBox(height: $styles.insets.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(colors.length, (index) {
                      return GestureDetector(
                        onTap: () => ref
                            .read(cardFormNotifierProvider.notifier)
                            .colorChanged(colors[index]),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors[index],
                          ),
                          height: 42.0,
                          width: 42.0,
                        ),
                      );
                    })
                  ],
                ),
                SizedBox(height: $styles.insets.xl),
              ],
            ),
          );
        },
      ),
    );
  }
}
