import 'package:flutter/material.dart';

import 'package:glum_mood_tracker/styles/styles.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

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
          const SeasonalMoodCard(),
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

class WeekDistributionCard extends StatelessWidget {
  const WeekDistributionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      customPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Text(
              'WEEKLY GLUM',
              style: $styles.text.caption.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              ...List.generate(
                7,
                (index) => Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCF2D4A),
                      border: Border.all(width: 0.1),
                    ),
                    child: Center(
                      child: Text(
                        'MON',
                        style: $styles.text.caption
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SeasonalMoodCard extends StatelessWidget {
  const SeasonalMoodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      customPadding: true,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Row(
              children: [
                Text(
                  'SEASONAL MOOD',
                  style: $styles.text.caption.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '30 DAYS',
                  style: $styles.text.caption.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Placeholder(
            fallbackHeight: 250,
          ),
        ],
      ),
    );
  }
}

class GlumDistributionCard extends StatelessWidget {
  const GlumDistributionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      customPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all($styles.insets.sm),
            child: Text(
              'GLUM DISTRIBUTION',
              style: $styles.text.caption.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              ...List.generate(
                5,
                (index) => Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD76A66),
                      border: Border.all(width: 0.1),
                    ),
                    child: Center(
                      child: Text(
                        '20%',
                        style: $styles.text.caption
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          // SizedBox(height: $styles.insets.xs),
        ],
      ),
    );
  }
}

class TopTagsCard extends StatelessWidget {
  const TopTagsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: Column(
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
                '5',
                style: $styles.text.bodySmallBold.copyWith(height: 0),
              ),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
          const Divider(),
          Wrap(
            children: const [
              TagChip(),
            ],
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
          Row(
            children: const [
              ToggleTagsFilterButton(title: 'MOODS'),
              SizedBox(
                height: 12,
                child: VerticalDivider(thickness: 1.5),
              ),
              ToggleTagsFilterButton(title: 'GLUMS'),
            ],
          ),
          Wrap(
            children: const [
              TagChip(),
            ],
          )
        ],
      ),
    );
  }
}

class ToggleTagsFilterButton extends StatelessWidget {
  const ToggleTagsFilterButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: $styles.text.caption.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      visualDensity: VisualDensity.compact,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.tag, size: 16.0),
          Text(
            'Food',
            style: $styles.text.bodySmall.copyWith(
              height: 0,
              fontSize: 12.0,
            ),
          ),
          SizedBox(width: $styles.insets.xs),
          Text(
            '3',
            style: $styles.text.bodySmall.copyWith(
              height: 0,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}

class StoryCountCard extends StatelessWidget {
  const StoryCountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '5',
                style: $styles.text.bodyBold.copyWith(height: 0),
              ),
              SizedBox(height: $styles.insets.xxs),
              Text(
                'All Stories',
                style: $styles.text.caption,
              )
            ],
          ),
          const SizedBox(
            height: 24,
            child: VerticalDivider(),
          ),
          Column(
            children: [
              Text(
                '5',
                style: $styles.text.bodyBold.copyWith(height: 0),
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
              padding: EdgeInsets.all($styles.insets.sm),
              child: const Icon(Icons.book),
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
