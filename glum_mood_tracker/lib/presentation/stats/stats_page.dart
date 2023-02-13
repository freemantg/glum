import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:glum_mood_tracker/styles/styles.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';

import '../../domain/tag.dart';
import '../../shared/providers.dart';
import '../cards/widgets/tag_bottom_modal_sheet.dart';
import '../cards/widgets/tag_chip.dart';
import 'widgets/trending_tag_chip.dart';

class StatsPage extends ConsumerStatefulWidget {
  const StatsPage({super.key});

  @override
  ConsumerState<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends ConsumerState<StatsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(statsNotifierProvider.notifier).fetchStats(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
        children: [
          const StoryTitleWidget(),
          SizedBox(height: $styles.insets.xs),
          const StoryCountCard(),
          SizedBox(height: $styles.insets.xs),
          const GlumDistributionCard(),
          SizedBox(height: $styles.insets.xs),
          const WeekDistributionCard(),
          SizedBox(height: $styles.insets.xs),
          const YearInGlumsCard(),
          SizedBox(height: $styles.insets.xs),
          const TagsDistributionCard(),
          SizedBox(height: $styles.insets.xs),
          const TopTagsCard(),
          SizedBox(height: $styles.insets.lg),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        )
      ],
    );
  }
}

class YearInGlumsCard extends StatelessWidget {
  const YearInGlumsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final monthInitials = [
      'J',
      'F',
      'M',
      'A',
      'M',
      'J',
      'J',
      'A',
      'S',
      'O',
      'N',
      'D'
    ];

    return StyledCard(
      customPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Text(
              'YEAR IN GLUMS',
              style: $styles.text.caption.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Table(
            children: [
              TableRow(
                children: [
                  const Text(''),
                  ...monthInitials
                      .map(
                        (e) => TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                            style: $styles.text.caption,
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
              //MONTH COLUMNS 31st - 1st
              for (int i = 1; i <= 31; i++)
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        i.toString(),
                        textAlign: TextAlign.center,
                        style: $styles.text.caption,
                      ),
                    ),
                    for (int j = 1; j <= 12; j++)
                      _buildYearIndividualGlum(day: i, month: j)
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}

Widget _buildYearIndividualGlum({required int day, required int month}) {
  return Consumer(
    builder: (context, ref, child) {
      final yearInGlumsMap = ref.watch(statsNotifierProvider).yearInGlums;
      int? glumRating;

      for (var key in yearInGlumsMap.keys) {
        if (DateUtils.isSameDay(
            key, DateTime(DateTime.now().year, month, day))) {
          glumRating = yearInGlumsMap[key];
        }
      }
      return AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: (glumRating != null) ? glumRating.ratingToColor() : null,
            border: Border.all(
              width: 0.5,
              color: const Color(0xFFDB6162).withOpacity(0.5),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(2.0)),
          ),
          child: (glumRating != null)
              ? Center(child: Text(glumRating.toString()))
              : const SizedBox.shrink(),
        ),
      );
    },
  );
}

class WeekDistributionCard extends ConsumerWidget {
  const WeekDistributionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StyledCard(
      customPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Text(
              'YOUR RECENT GLUMS',
              style: $styles.text.caption.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              ...List.generate(
                  ref.watch(statsNotifierProvider).weeklyGlum.keys.length,
                  (index) {
                final storyDate = ref
                    .watch(statsNotifierProvider)
                    .weeklyGlum
                    .keys
                    .toList()[index];
                return Expanded(
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 48),
                    decoration: BoxDecoration(
                      color: (ref
                              .watch(statsNotifierProvider)
                              .weeklyGlum[storyDate])!
                          .ratingToColor(),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            storyDate.dateTimeInDayFormat,
                            style: $styles.text.caption
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: $styles.insets.xxs),
                          Text(storyDate.dateTimeInShortDayFormat,
                              style: $styles.text.caption),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}

class GlumDistributionCard extends ConsumerWidget {
  const GlumDistributionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glumDistribution = ref.watch(statsNotifierProvider).glumDistribution;

    return StyledCard(
      customPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Text(
              'GLUM DISTRIBUTION',
              style: $styles.text.caption.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              ...List.generate(
                glumDistribution.keys.length,
                (index) {
                  final glumPercentage = glumDistribution[index + 1];
                  if (glumPercentage != 0) {
                    return Expanded(
                      flex: (glumDistribution[index + 1] ?? 0),
                      child: Container(
                        padding: EdgeInsets.all($styles.insets.sm),
                        decoration: BoxDecoration(
                          color: (index + 1).ratingToColor(),
                        ),
                        child: Center(
                          child: Text((glumDistribution[index + 1]).toString()),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TopTagsCard extends ConsumerWidget {
  const TopTagsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingTags = ref.watch(statsNotifierProvider).trendingTags;

    return StyledCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'TRENDING TAGS',
                style: $styles.text.caption.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                trendingTags.length.toString(),
                style: $styles.text.bodySmallBold.copyWith(height: 0),
              ),
              GestureDetector(
                child: const Icon(Icons.keyboard_arrow_right),
                onTap: () => showTagModalBottomSheet(context),
              )
            ],
          ),
          const Divider(),
          Wrap(
            spacing: $styles.insets.xs,
            children: trendingTags.entries
                .map((e) => TrendingTagChip(
                      tag: e.key,
                      count: e.value,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class TagsDistributionCard extends StatelessWidget {
  const TagsDistributionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: Column(
        children: [
          const ToggleTagsFilterButton(),
          Wrap(
            children: const [
              TagChip(
                tag: Tag(title: 'tags'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ToggleTagsFilterButton extends HookWidget {
  const ToggleTagsFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    var isMoodsFilter = useState(true);

    return GestureDetector(
      onTap: () => isMoodsFilter.value = !isMoodsFilter.value,
      child: Row(
        children: [
          Text(
            'MOODS',
            style: $styles.text.caption.copyWith(
              fontWeight: FontWeight.bold,
              color: isMoodsFilter.value ? const Color(0xFFD76A66) : null,
            ),
          ),
          const SizedBox(
            height: 12,
            child: VerticalDivider(thickness: 1.5),
          ),
          Text(
            'GLUMS',
            style: $styles.text.caption.copyWith(
              fontWeight: FontWeight.bold,
              color: !isMoodsFilter.value ? const Color(0xFFD76A66) : null,
            ),
          ),
        ],
      ),
    );
  }
}

class StoryCountCard extends ConsumerWidget {
  const StoryCountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StyledCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                ref.watch(statsNotifierProvider).allStoriesCount.toString(),
                style: $styles.text.bodyBold.copyWith(
                  height: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: $styles.insets.xxs),
              Text(
                'All Stories',
                style: $styles.text.caption,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
            child: VerticalDivider(),
          ),
          Column(
            children: [
              Text(
                ref.watch(statsNotifierProvider).glumAverage.toStringAsFixed(2),
                style: $styles.text.bodyBold.copyWith(
                  height: 0,
                  fontWeight: FontWeight.bold,
                  color: ref
                      .watch(statsNotifierProvider)
                      .glumAverage
                      .ceil()
                      .ratingToColor(),
                ),
              ),
              SizedBox(height: $styles.insets.xxs),
              Text(
                'Glum Average',
                style: $styles.text.caption,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class StoryTitleWidget extends StatelessWidget {
  const StoryTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: $styles.insets.lg),
          child: StyledCard(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.edit,
                    size: 12,
                  ),
                ),
                SizedBox(height: $styles.insets.xxs),
                Text('Stories', style: $styles.text.bodyBold),
                SizedBox(height: $styles.insets.xxs),
                Text(
                  'What matters is the interior',
                  style: $styles.text.caption,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular($styles.corners.md),
            ),
            color: const Color(0xFFD76A66),
            child: Padding(
              padding: EdgeInsets.all($styles.insets.xs),
              child: Text('🐍', style: $styles.text.h3),
            ),
          ),
        ),
      ],
    );
  }
}

class StyledCard extends StatelessWidget {
  const StyledCard({
    super.key,
    required this.child,
    this.customPadding = false,
  });

  final Widget child;
  final bool customPadding;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular($styles.corners.md)),
      ),
      child: Padding(
        padding: customPadding
            ? const EdgeInsets.all(0)
            : EdgeInsets.all($styles.insets.sm),
        child: child,
      ),
    );
  }
}
