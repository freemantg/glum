import 'package:flutter/material.dart';

import '../../../domain/tag.dart';
import '../../../styles/styles.dart';

class TrendingTagChip extends StatelessWidget {
  const TrendingTagChip({
    super.key,
    required this.tag,
    required this.count,
  });

  final Tag tag;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide.none,
      labelPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular($styles.corners.md)),
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.scale(
            scaleX: -1,
            child: const Icon(
              Icons.sell_outlined,
              size: 12.0,
            ),
          ),
          SizedBox(width: $styles.insets.xs),
          Text(
            tag.title,
            style: $styles.text.caption.copyWith(
              height: 0,
            ),
          ),
          SizedBox(width: $styles.insets.xs),
          Text(
            count.toString(),
            style: $styles.text.caption.copyWith(
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
