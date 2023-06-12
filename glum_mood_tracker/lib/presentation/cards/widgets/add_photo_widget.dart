import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

import '../../../shared/providers.dart';

class AddPhotoWidget extends ConsumerWidget {
  const AddPhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyForm = ref.watch(storyFormNotifierProvider);

    final mediaQuery = MediaQuery.of(context);
    final containerHeight = mediaQuery.size.height / 2.5;

    return Container(
      color: Colors.white.withOpacity(0.1),
      height: containerHeight,
      child: storyForm.story.photos.isEmpty
          ? IconButton(
              onPressed: () =>
                  ref.read(storyFormNotifierProvider.notifier).photoChanged(),
              icon: Icon(
                Icons.add_a_photo,
                color: $styles.primaryThemeColor,
              ),
            )
          : Image.file(
              File(storyForm.story.photos.first.filePath),
              fit: BoxFit.cover,
            ),
    );
  }
}
