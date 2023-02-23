import 'package:flutter/material.dart';

import '../../../domain/tag.dart';
import '../../../styles/styles.dart';

class TagChip extends StatelessWidget {
  const TagChip({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide(color: Colors.white.withOpacity(0.1)),
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular($styles.corners.lg)),
      ),
      labelPadding: EdgeInsets.zero,
      label: Text("# ${tag.title}", style: $styles.text.caption),
    );
  }
}
