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
      backgroundColor: const Color(0xFFD76A66),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "#${tag.title}",
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
