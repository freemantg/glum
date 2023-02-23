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
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all($styles.insets.lg),
                                child: Column(
                                  children: [
                                    Text(
                                      story.date.day.toString(),
                                      style: $styles.text.h3,
                                    ),
                                    Text(
                                      story.date.dateTimeInDayFormat,
                                      style: $styles.text.caption,
                                    ),
                                    SizedBox(height: $styles.insets.sm),
                                    Text(story.glumRating.toString())
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: constraints.maxHeight / 4,
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
        style: $styles.text.title2,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
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
