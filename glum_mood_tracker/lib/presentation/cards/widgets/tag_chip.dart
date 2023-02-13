import 'package:flutter/material.dart';

import '../../../domain/tag.dart';
import '../../../styles/styles.dart';

class TagChip extends StatelessWidget {
  const TagChip({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
      visualDensity: VisualDensity.compact,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tag.title,
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
