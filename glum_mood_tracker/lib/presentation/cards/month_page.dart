import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/styles/styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/models.dart';
import '../routes/app_router.gr.dart';
import '../../shared/providers.dart';
import '../stats/widgets/styled_card.dart';
import 'widgets/widgets.dart';

class MonthPage extends HookConsumerWidget {
  const MonthPage({
    Key? key,
    required this.monthYear,
  }) : super(key: key);

  final DateTime monthYear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
            child: ref.watch(storyNotifierProvider).maybeWhen(
                  loadSuccess: (stories) => ListView.builder(
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      final story = stories[index];
                      return _StoryItem(
                        story: story,
                        maxHeight: constraints.maxHeight / 4,
                        onLongPress: () => ref
                            .read(storyNotifierProvider.notifier)
                            .deleteStory(story.id!),
                        onTap: () =>
                            context.router.push(StoryPageRoute(story: story)),
                      );
                    },
                  ),
                  orElse: () => null,
                ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        DateTime(
          monthYear.year,
          monthYear.month,
        ).dateTimeInMonthYearString,
        style: $styles.text.bodyBold,
      ),
      centerTitle: true,
      actions: const [Icon(Icons.sort)],
    );
  }
}

class _StoryItem extends StatelessWidget {
  final StoryModel story;
  final double maxHeight;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const _StoryItem({
    Key? key,
    required this.story,
    required this.maxHeight,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: StyledCard(
        customPadding: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: Row(
            children: [
              _DateColumn(story: story),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: (story.photos.isNotEmpty)
                      ? Image.file(
                          story.photos.first.file!,
                          fit: BoxFit.cover,
                        )
                      : TitleAndDescriptionWidget(story: story),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DateColumn extends StatelessWidget {
  final StoryModel story;

  const _DateColumn({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: $styles.insets.xs),
          Text(
            story.date.day.toString(),
            style: $styles.text.h2Condensed,
          ),
          Text(
            story.date.dateTimeInDayFormat.toUpperCase(),
            style: $styles.text.caption.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: $styles.insets.xs),
        ],
      ),
    );
  }
}
