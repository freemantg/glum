import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:glum_mood_tracker/presentation/routes/app_router.gr.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

import '../../domain/story.dart';
import 'widgets/tag_chip.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Placeholder(fallbackHeight: 250),
            Padding(
              padding: EdgeInsets.all($styles.insets.sm),
              child: Column(
                children: [
                  SizedBox(height: $styles.insets.sm),
                  Text(story.title, style: $styles.text.h3),
                  SizedBox(height: $styles.insets.xs),
                  Text(
                    story.date.dateTimeInStoryPageFormat,
                    style: $styles.text.caption.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: $styles.insets.sm),
                  Text(
                    story.glumRating.toString(),
                    style: $styles.text.h3,
                  ),
                  SizedBox(height: $styles.insets.md),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      story.description,
                      textAlign: TextAlign.left,
                      style: $styles.text.bodySmall.copyWith(
                        color: Colors.grey.withOpacity(0.95),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: StyledBottomBar(story: story),
    );
  }
}

class StyledBottomBar extends StatelessWidget {
  const StyledBottomBar({
    super.key,
    required this.story,
  });

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: $styles.insets.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: $styles.insets.sm),
                child: Wrap(
                  spacing: $styles.insets.xs,
                  children: story.tags.map((e) => TagChip(tag: e)).toList(),
                ),
              ),
              const Divider(height: 0),
              Row(
                children: [
                  IconButton(
                    onPressed: () =>
                        context.router.push(AddStoryPageRoute(story: story)),
                    icon: const Icon(Icons.more_horiz),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => context.router.pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
