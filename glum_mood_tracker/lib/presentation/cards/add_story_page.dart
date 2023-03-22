import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:glum_mood_tracker/styles/styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/models.dart';
import 'widgets/widgets.dart';

class AddStoryPage extends HookConsumerWidget {
  const AddStoryPage({Key? key, this.story}) : super(key: key);

  final StoryModel? story;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() =>
          ref.read(storyFormNotifierProvider.notifier).initialiseStory(story));
      return null;
    });

    return Scaffold(
      appBar: _buildAppBar(context, ref),
      body: ListView(
        children: [
          const AddPhotoWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: $styles.insets.sm,
              horizontal: $styles.insets.lg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextField(title: story?.title),
                SizedBox(height: $styles.insets.xs),
                const RatingBarWidget(),
                SizedBox(height: $styles.insets.sm),
                DescriptionTextField(description: story?.description),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: TagBar(ref: ref),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.close),
      ),
      title: GestureDetector(
        onTap: () {
          showDatePicker(
            context: context,
            initialDate: ref.read(storyFormNotifierProvider).story.date,
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
          ).then(
            (selectedDate) => ref
                .read(storyFormNotifierProvider.notifier)
                .dateChanged(selectedDate ?? DateTime.now()),
          );
        },
        child: Text(
          ref.watch(storyFormNotifierProvider).story.date.dateTimeInString,
          style: $styles.text.bodyBold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => ref
              .read(storyFormNotifierProvider.notifier)
              .save()
              .then((_) => Navigator.of(context).pop()),
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }
}
