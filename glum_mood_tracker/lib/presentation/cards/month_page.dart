import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

import '../routes/app_router.gr.dart';
import '../../shared/providers.dart';
import '../stats/widgets/styled_card.dart';
import 'widgets/widgets.dart';

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
            child: ref.watch(storyNotifierProvider).maybeWhen(
                  loadSuccess: (stories) => ListView.builder(
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      final story = stories[index];

                      return GestureDetector(
                        onLongPress: () => ref
                            .read(storyNotifierProvider.notifier)
                            .deleteStory(story.id!),
                        onTap: () =>
                            context.router.push(StoryPageRoute(story: story)),
                        child: StyledCard(
                          customPadding: true,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: constraints.maxHeight / 4,
                            ),
                            child: Row(
                              children: [
                                Padding(
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
                                        story.date.dateTimeInDayFormat
                                            .toUpperCase(),
                                        style: $styles.text.caption.copyWith(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
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
      actions: const [Icon(Icons.sort)],
    );
  }
}
