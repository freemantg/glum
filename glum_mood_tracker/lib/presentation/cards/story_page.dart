import 'dart:io';

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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              children: [
                if (story.photos.isNotEmpty)
                  Image.file(
                    File(story.photos.first.filePath),
                    height: constraints.maxHeight / 2,
                    fit: BoxFit.cover,
                  ),
                Padding(
                  padding: EdgeInsets.only(
                    left: $styles.insets.sm,
                    right: $styles.insets.sm,
                    bottom: $styles.insets.sm,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: $styles.insets.sm),
                      Text(
                        story.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: $styles.text.h3,
                      ),
                      SizedBox(height: $styles.insets.xs),
                      Text(
                        story.date.dateTimeInStoryPageFormat,
                        style: $styles.text.caption
                            .copyWith(color: Colors.white70),
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
                          style: $styles.text.bodySmall
                              .copyWith(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
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
              const Divider(
                thickness: 0.1,
                height: 0,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.router
                        .push(AddStoryPageRoute(story: story))
                        .then((_) => context.popRoute()),
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
