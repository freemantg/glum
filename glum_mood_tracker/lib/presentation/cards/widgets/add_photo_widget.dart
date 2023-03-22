import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';

class AddPhotoWidget extends ConsumerWidget {
  const AddPhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyForm = ref.watch(storyFormNotifierProvider);

    return Container(
      color: Colors.white.withOpacity(0.1),
      height: MediaQuery.of(context).size.height / 2.5,
      child: storyForm.story.photos.isEmpty
          ? IconButton(
              onPressed: () =>
                  ref.read(storyFormNotifierProvider.notifier).photoChanged(),
              icon: const Icon(
                Icons.add_a_photo,
                color: Color(0xFFDA736E),
              ),
            )
          : Image.file(
              File(storyForm.story.photos.first.filePath),
              fit: BoxFit.cover,
            ),
    );
  }
}
