import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/domain/story.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

import '../routes/app_router.gr.dart';
import '../stats/stats_page.dart';

class MonthPage extends ConsumerStatefulWidget {
  const MonthPage({
    super.key,
    required this.monthYear,
  });

  final DateTime monthYear;

  @override
  ConsumerState<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends ConsumerState<MonthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
            child: ref.watch(storiesNotifierProvider).maybeWhen(
                  loadSuccess: (stories) => ListView.builder(
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      final story = stories[index];

                      return GestureDetector(
                        onLongPress: () => ref
                            .read(storiesNotifierProvider.notifier)
                            .deleteStory(story.id!),
                        onTap: () =>
                            context.router.push(StoryPageRoute(story: story)),
                        child: StyledCard(
                          customPadding: true,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: constraints.maxHeight / 4.5,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all($styles.insets.lg),
                                  child: Column(
                                    children: [
                                      SizedBox(height: $styles.insets.xs),
                                      Text(
                                        story.date.day.toString(),
                                        style: $styles.text.h2.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              story.glumRating.ratingToColor(),
                                        ),
                                      ),
                                      Text(
                                        story.date.dateTimeInDayFormat,
                                        style: $styles.text.caption,
                                      ),
                                      SizedBox(height: $styles.insets.xs),
                                    ],
                                  ),
                                ),
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
                                        : TitleAndDescriptionWidget(
                                            story: story,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
          widget.monthYear.year,
          widget.monthYear.month,
        ).dateTimeInMonthYearString,
        style: $styles.text.bodyBold,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sort),
        ),
      ],
    );
  }
}

class TitleAndDescriptionWidget extends StatelessWidget {
  const TitleAndDescriptionWidget({
    super.key,
    required this.story,
  });

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const QuotationDecal(),
        Padding(
          padding: EdgeInsets.all($styles.insets.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                story.title,
                style: $styles.text.bodySmallBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                story.description,
                style: $styles.text.caption.copyWith(
                  color: Colors.white70,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: QuotationDecal(),
        ),
      ],
    );
  }
}

class QuotationDecal extends StatelessWidget {
  const QuotationDecal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.xs),
      child: Text(
        '"',
        style: $styles.text.h3.copyWith(color: Colors.white70),
      ),
    );
  }
}
