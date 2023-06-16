import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';

class DescriptionTextField extends HookConsumerWidget {
  const DescriptionTextField({
    Key? key,
    this.description,
  }) : super(key: key);

  final String? description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final descriptionController = useTextEditingController(text: description);

    return TextField(
      controller: descriptionController,
      style: $styles.text.body.copyWith(color: Colors.white60),
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: $styles.text.bodySmall.copyWith(color: Colors.grey),
        hintText: 'Write about your glum...',
      ),
      onChanged: (str) =>
          ref.read(storyFormNotifierProvider.notifier).descriptionChanged(str),
    );
  }
}
