import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';

class TitleTextField extends HookConsumerWidget {
  const TitleTextField({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: title);

    return TextField(
      controller: titleController,
      textAlign: TextAlign.center,
      style: $styles.text.h3.copyWith(fontSize: 18.0),
      decoration:
          const InputDecoration(border: InputBorder.none, hintText: "Title"),
      onChanged: (value) =>
          ref.read(storyFormNotifierProvider.notifier).titleChanged(value),
    );
  }
}
