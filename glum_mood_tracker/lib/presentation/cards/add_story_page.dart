import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
                const TitleTextField(),
                const Divider(height: 0),
                SizedBox(height: $styles.insets.xs),
                const RatingBarWidget(),
                const Divider(),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingBar(
            glow: false,
            minRating: 1,
            initialRating: ref
                .watch(storyFormNotifierProvider)
                .story
                .glumRating
                .toDouble(),
            itemSize: 24.0,
            itemPadding: EdgeInsets.symmetric(horizontal: $styles.insets.xxs),
            onRatingUpdate: (rating) => ref
                .read(storyFormNotifierProvider.notifier)
                .ratingChanged(rating.toInt()),
            ratingWidget: RatingWidget(
              full: Container(
                color: const Color(0xFFE35062),
                height: 16.0,
                width: 16.0,
              ),
              half: const SizedBox.shrink(),
              empty: Container(
                color: const Color(0XFFC17D35).withOpacity(0.25),
                height: 16.0,
                width: 16.0,
              ),
            ),
          ),
        ],
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

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.1),
      height: MediaQuery.of(context).size.height / 2.5,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add_a_photo,
          color: Color(0xFFDA736E),
        ),
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
      style: $styles.text.body,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: formState.story.description.isEmpty
            ? 'Write about your glum...'
            : formState.story.description,
      ),
      onChanged: (str) =>
          ref.read(storyFormNotifierProvider.notifier).descriptionChanged(str),
    );
  }
}

class TitleTextField extends ConsumerWidget {
  const TitleTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(storyFormNotifierProvider);

    return TextField(
      textAlign: TextAlign.center,
      style: $styles.text.h3.copyWith(fontSize: 18.0),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText:
            formState.story.title.isEmpty ? 'Title' : formState.story.title,
      ),
      onChanged: (value) =>
          ref.read(storyFormNotifierProvider.notifier).titleChanged(value),
    );
  }
}
