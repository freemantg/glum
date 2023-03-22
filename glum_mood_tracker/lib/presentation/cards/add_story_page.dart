import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:glum_mood_tracker/styles/styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/models.dart';
import 'widgets/tag_bottom_modal_sheet.dart';
import 'widgets/widgets.dart';

class AddStoryPage extends ConsumerStatefulWidget {
  const AddStoryPage({super.key, this.story});

  final StoryModel? story;

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
                SizedBox(height: $styles.insets.sm),
                DescriptionTextField(description: widget.story?.description),
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
              style: $styles.text.bodyBold,
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

class AddTagWidget extends StatelessWidget {
  const AddTagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Transform.scale(
        scaleX: -1,
        child: Icon(
          Icons.sell_outlined,
          size: 16.0,
          color: Colors.grey.withOpacity(0.85),
        ),
      ),
      onTap: () => showTagModalBottomSheet(context),
    );
  }
}

