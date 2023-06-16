import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import 'widgets.dart';

class TagBar extends ConsumerWidget {
  const TagBar({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref
        .watch(storyFormNotifierProvider)
        .selectedTags
        .map((tag) => tag.title)
        .toList();

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const AddTagWidget(),
        SizedBox(width: $styles.insets.xs),
        Text(
          tags.join(', '),
          style: $styles.text.bodySmall.copyWith(
            color: Colors.white.withOpacity(0.45),
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
