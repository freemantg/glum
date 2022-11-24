import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

class AddStoryPage extends StatelessWidget {
  const AddStoryPage({super.key});

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
              children: [
                const TitleTextField(),
                const Divider(height: 0),
                SizedBox(height: $styles.insets.xs),
                const RatingBarWidget(),
                const Divider(),
                SizedBox(height: $styles.insets.xs),
                const DescriptionTextField()
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
      title: Text(
        'WED, AUGUST 31 2022',
        style: $styles.text.bodySmall,
      ),
      centerTitle: true,
      actions: [
        Consumer(
          builder: (context, ref, child) => IconButton(
            onPressed: () =>
                ref.read(storyFormNotifierProvider.notifier).save(),
            icon: const Icon(Icons.check),
          ),
        ),
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
    return Row(
      children: [
        const Spacer(flex: 3),
        RatingBar(
          minRating: 1,
          initialRating:
              ref.watch(storyFormNotifierProvider).story.glumRating.toDouble(),
          itemSize: 24.0,
          itemPadding: EdgeInsets.symmetric(horizontal: $styles.insets.xxs),
          onRatingUpdate: (rating) => ref
              .read(storyFormNotifierProvider.notifier)
              .ratingChanged(rating.toInt()),
          ratingWidget: RatingWidget(
            full: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE35062),
                borderRadius: BorderRadius.circular(2.0),
              ),
              height: 16.0,
              width: 16.0,
            ),
            half: const SizedBox.shrink(),
            empty: Container(
              decoration: BoxDecoration(
                color: const Color(0XFFC17D35).withOpacity(0.25),
                borderRadius: BorderRadius.circular(2.0),
              ),
              height: 16.0,
              width: 16.0,
            ),
          ),
        ),
        const Spacer(),
        const AddTagWidget(),
        const Spacer(),
      ],
    );
  }
}

class AddTagWidget extends StatelessWidget {
  const AddTagWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.tag,
        color: Colors.grey.withOpacity(0.85),
      ),
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular($styles.corners.md),
          ),
        ),
        context: context,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Tags',
                style: $styles.text.bodyBold.copyWith(height: 0),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  leading: Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  title: Row(
                    children: [
                      Text('Tag', style: $styles.text.bodyBold),
                      const Spacer(),
                      Text(
                        '5',
                        style: $styles.text.bodyBold.copyWith(height: 0),
                      )
                    ],
                  ),
                  trailing: const Icon(Icons.more_vert),
                );
              },
            ),
          );
        },
      ),
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
