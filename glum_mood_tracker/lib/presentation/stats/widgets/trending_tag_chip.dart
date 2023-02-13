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
      visualDensity: VisualDensity.compact,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "#${tag.title}",
            style: $styles.text.bodySmall.copyWith(
              height: 0,
              fontSize: 12.0,
            ),
          ),
          SizedBox(width: $styles.insets.xs),
          Text(
            count.toString(),
            style: $styles.text.bodySmall.copyWith(
              height: 0,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
