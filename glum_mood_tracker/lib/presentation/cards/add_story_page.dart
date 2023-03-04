import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:glum_mood_tracker/styles/styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/story.dart';
import 'widgets/tag_bottom_modal_sheet.dart';
import 'widgets/tag_chip.dart';

class AddStoryPage extends ConsumerStatefulWidget {
  const AddStoryPage({super.key, this.story});

  final Story? story;

  @override
  ConsumerState<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends ConsumerState<AddStoryPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(storyFormNotifierProvider.notifier)
          .initialiseStory(widget.story),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
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
                TitleTextField(title: widget.story?.title),
                SizedBox(height: $styles.insets.xs),
                const RatingBarWidget(),
                SizedBox(height: $styles.insets.xs),
                const DescriptionTextField(),
                TagBar(ref: ref),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.router.pop(),
        icon: const Icon(Icons.close),
      ),
      title: Consumer(
        builder: (context, ref, child) {
          return GestureDetector(
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
              style: $styles.text.bodySmall,
            ),
          );
        },
      ),
      centerTitle: true,
      actions: [
        Consumer(
          builder: (context, ref, child) => IconButton(
            onPressed: () => ref
                .read(storyFormNotifierProvider.notifier)
                .save()
                .then((_) => context.router.pop()),
            icon: const Icon(Icons.check),
          ),
        ),
      ],
    );
  }
}

class TagBar extends ConsumerWidget {
  const TagBar({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: $styles.insets.xs,
      children: [
        const AddTagWidget(),
        ...ref
            .watch(storyFormNotifierProvider)
            .selectedTags
            .map((e) => TagChip(tag: e))
            .toList()
      ],
    );
  }
}

class RatingBarWidget extends ConsumerWidget {
  const RatingBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: RatingBar.builder(
        itemPadding: EdgeInsets.only(left: $styles.insets.xs),
        glow: false,
        itemSize: 24,
        unratedColor: const Color(0xFFDB6162).withOpacity(0.15),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all($styles.insets.xs),
            decoration: BoxDecoration(
              color: (index + 1).ratingToColor(),
              borderRadius: BorderRadius.circular(4.0),
            ),
          );
        },
        onRatingUpdate: (rating) => ref
            .read(storyFormNotifierProvider.notifier)
            .ratingChanged(rating.toInt()),
      ),
    );
  }
}

class AddTagWidget extends StatelessWidget {
  const AddTagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.tag,
        color: Colors.grey.withOpacity(0.85),
      ),
      onTap: () => showTagModalBottomSheet(context),
    );
  }
}

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

class DescriptionTextField extends ConsumerWidget {
  const DescriptionTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(storyFormNotifierProvider);

    return TextField(
      style: $styles.text.body.copyWith(color: Colors.white60),
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: $styles.text.bodySmall,
        hintText: formState.story.description.isEmpty
            ? 'Write about your glum...'
            : formState.story.description,
      ),
      onChanged: (str) =>
          ref.read(storyFormNotifierProvider.notifier).descriptionChanged(str),
    );
  }
}

class TitleTextField extends HookConsumerWidget {
  const TitleTextField({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: title);

    return Column(
      children: [
        TextField(
          controller: titleController,
          textAlign: TextAlign.center,
          style: $styles.text.h3.copyWith(fontSize: 18.0),
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "Title"),
          onChanged: (value) =>
              ref.read(storyFormNotifierProvider.notifier).titleChanged(value),
        ),
      ],
    );
  }
}
