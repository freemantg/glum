import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

import '../../domain/story.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
        child: ref.watch(storiesNotifierProvider).maybeWhen(
              loadSuccess: (stories) => ListView.builder(
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];

                  return GestureDetector(
                    onTap: () => context.router.push(
                      StoryPageRoute(story: Story.empty()),
                    ),
                    child: StyledCard(
                      customPadding: true,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all($styles.insets.lg),
                            child: Column(
                              children: [
                                Text(
                                    'ID: ${story.id} TAGS: ${story.tags.length}'),
                                ...story.tags
                                    .map((e) => Text(e.title))
                                    .toList(),
                                Text(
                                  story.date.day.toString(),
                                  style: $styles.text.h3,
                                ),
                                Text(story.date.dateTimeInDayFormat,
                                    style: $styles.text.h4.copyWith(
                                      fontWeight: FontWeight.normal,
                                      height: 0,
                                    )),
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
                              child: Column(
                                children: const [
                                  Placeholder(
                                    fallbackHeight: 148.0,
                                    strokeWidth: 0,
                                  )
                                ],
                              ),
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
