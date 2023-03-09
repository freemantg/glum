import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:glum_mood_tracker/styles/styles.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers.dart';
import '../cards/widgets/tag_bottom_modal_sheet.dart';
import 'widgets/doughnut_chart.dart';
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
      () => ref.watch(statsNotifierProvider.notifier).fetchStats(),
    );
    Future.microtask(
        () => ref.watch(photosStateNotifier.notifier).getAllPhotos());
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
          const PhotosCard(),
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
            child: Text('Year in Glums', style: $styles.text.bodySmallBold),
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
              color: const Color(0xFFDB6162).withOpacity(0.2),
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
            child: Text('Recent Glums', style: $styles.text.bodySmallBold),
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

class HalfClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(0, size.height / 2)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(HalfClipper oldClipper) => false;
}

class GlumDistributionCard extends ConsumerWidget {
  const GlumDistributionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glumDistribution = ref.watch(statsNotifierProvider).glumDistribution;
    final totalGlumCount =
        glumDistribution.values.fold(0, (x, y) => x + (y ?? 0));

    const heightFactor = 0.5;
    const doughnutChartHeight = 250.0;

    return StyledCard(
      customPadding: true,
      child: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Glum Count', style: $styles.text.bodySmallBold),
            Text(
              'What matters is the interior',
              style: $styles.text.caption
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            Align(
              alignment: Alignment.topCenter,
              heightFactor: heightFactor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  DoughnutChart(
                    data: glumDistribution.values.map((e) => e).toList(),
                    width: doughnutChartHeight,
                    height: doughnutChartHeight,
                  ),
                  Positioned(
                    bottom: doughnutChartHeight / 2,
                    child: Column(
                      children: [
                        Text(totalGlumCount.toString(), style: $styles.text.h2),
                        Text('Total glums', style: $styles.text.caption),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: $styles.insets.md),
            ...glumDistribution.entries
                .map(
                  (e) => GlumCountPercentageBar(
                    glumRating: e.key,
                    count: e.value ?? 0,
                    totalGlums: 5,
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}

class GlumCountPercentageBar extends StatelessWidget {
  const GlumCountPercentageBar({
    super.key,
    required this.glumRating,
    required this.count,
    required this.totalGlums,
  });

  final int glumRating;
  final int count;
  final int totalGlums;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: $styles.insets.xs,
        horizontal: $styles.insets.xxs,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 24.0),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all($styles.insets.xxs),
                decoration: BoxDecoration(
                  color: glumRating.ratingToColor(),
                  borderRadius: BorderRadius.all(
                    Radius.circular($styles.corners.sm),
                  ),
                ),
                child: Text(glumRating.toString()),
              ),
            ),
            SizedBox(width: $styles.insets.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),
                    child: LinearProgressIndicator(
                      value: count / totalGlums,
                      backgroundColor:
                          glumRating.ratingToColor().withOpacity(0.25),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          glumRating.ratingToColor()),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        glumRating.ratingToLabel(),
                        style: $styles.text.caption.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '$count / ${((count / totalGlums) * 100).toInt()}%',
                        style: $styles.text.caption.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotosCard extends ConsumerStatefulWidget {
  const PhotosCard({
    super.key,
  });

  @override
  ConsumerState<PhotosCard> createState() => _PhotosCardState();
}

class _PhotosCardState extends ConsumerState<PhotosCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final glumDistribution = ref.watch(statsNotifierProvider).glumDistribution;
    final photos = ref.watch(photosStateNotifier).photos;

    return StyledCard(
      customPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Text('Photos', style: $styles.text.bodySmallBold),
          ),
          ...photos.map((e) => Image.file(e.file!)).toList()
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
              Text('Trending Tags', style: $styles.text.bodySmallBold),
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
          SizedBox(height: $styles.insets.sm),
          Wrap(
            alignment: WrapAlignment.center,
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

class TagsDistributionCard extends ConsumerWidget {
  const TagsDistributionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingTags = ref.watch(statsNotifierProvider).trendingMoodsOrGlums;
    return StyledCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ToggleTagsFilterButton(),
          SizedBox(height: $styles.insets.sm),
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

class ToggleTagsFilterButton extends HookConsumerWidget {
  const ToggleTagsFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isMoodsFilter = useState(true);

    return GestureDetector(
      onTap: () {
        isMoodsFilter.value = !isMoodsFilter.value;
        ref
            .read(statsNotifierProvider.notifier)
            .tagsByMoodsOrGlums(isMoodsFilter.value);
      },
      child: Row(
        children: [
          Text(
            'Moods',
            style: $styles.text.bodySmallBold.copyWith(
              color: isMoodsFilter.value
                  ? const Color(0xFFD76A66)
                  : Theme.of(context).disabledColor,
            ),
          ),
          SizedBox(width: $styles.insets.xs),
          Text(
            'Glums',
            style: $styles.text.bodySmallBold.copyWith(
              color: !isMoodsFilter.value
                  ? const Color(0xFFD76A66)
                  : Theme.of(context).disabledColor,
            ),
          ),
          const Spacer(),
          Text(
            ref
                .watch(statsNotifierProvider)
                .trendingMoodsOrGlums
                .keys
                .length
                .toString(),
            style: $styles.text.bodySmallBold.copyWith(height: 0),
          ),
          GestureDetector(
            child: const Icon(Icons.keyboard_arrow_right),
            onTap: () => showTagModalBottomSheet(context),
          )
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                style: $styles.text.caption
                    .copyWith(color: Theme.of(context).disabledColor),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                ref.watch(statsNotifierProvider).glumAverage.toStringAsFixed(2),
                style: $styles.text.bodyBold.copyWith(
                  height: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: $styles.insets.xxs),
              Text(
                'Glum Average',
                style: $styles.text.caption
                    .copyWith(color: Theme.of(context).disabledColor),
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
                  style: $styles.text.caption
                      .copyWith(color: Theme.of(context).disabledColor),
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
      elevation: 0,
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
