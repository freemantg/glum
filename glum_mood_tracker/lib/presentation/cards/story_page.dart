import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

import '../../domain/models/models.dart';
import 'widgets/widgets.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({Key? key, required this.story}) : super(key: key);

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              children: [
                _buildStoryImage(constraints),
                _buildStoryDetails(context),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: StyledBottomBar(story: story),
    );
  }

  Widget _buildStoryImage(BoxConstraints constraints) {
    if (story.photos.isNotEmpty) {
      return Image.file(
        File(story.photos.first.filePath),
        height: constraints.maxHeight / 2,
        fit: BoxFit.cover,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildStoryDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: $styles.insets.sm,
        right: $styles.insets.sm,
        bottom: $styles.insets.sm,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: $styles.insets.lg),
          _buildStoryTitle(),
          SizedBox(height: $styles.insets.xs),
          _buildStoryDate(),
          SizedBox(height: $styles.insets.sm),
          _buildStoryRating(),
          SizedBox(height: $styles.insets.md),
          _buildStoryDescription(),
        ],
      ),
    );
  }

  Widget _buildStoryTitle() {
    return Text(
      story.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: $styles.text.h3,
    );
  }

  Widget _buildStoryDate() {
    return Text(
      story.date.dateTimeInStoryPageFormat,
      style: $styles.text.caption.copyWith(color: Colors.grey),
    );
  }

  Widget _buildStoryRating() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: $styles.insets.xxs,
        horizontal: $styles.insets.xs,
      ),
      decoration: BoxDecoration(
        color: story.glumRating.ratingToColor().withOpacity(0.1),
        border: Border.all(
          width: 1.5,
          color: Colors.white70.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular($styles.corners.md),
      ),
      child: Text(
        story.glumRating.toString(),
        style: $styles.text.bodySmallBold.copyWith(height: 0),
      ),
    );
  }

  Widget _buildStoryDescription() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        story.description,
        textAlign: TextAlign.left,
        style: $styles.text.bodySmall.copyWith(color: Colors.white70),
      ),
    );
  }
}
