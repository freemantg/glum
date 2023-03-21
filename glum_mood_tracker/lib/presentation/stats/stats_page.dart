import 'package:flutter/material.dart';

import 'package:glum_mood_tracker/styles/styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers.dart';
import 'widgets/widgets.dart';

class StatsPage extends ConsumerStatefulWidget {
  const StatsPage({super.key});

  @override
  ConsumerState<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends ConsumerState<StatsPage> {
  @override
  void initState() {
    super.initState();
    Future.wait(
      [
        ref.watch(statsNotifierProvider.notifier).fetchStats(),
        ref.watch(photosStateNotifierProvider.notifier).getAllPhotos(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: EdgeInsets.only(
          left: $styles.insets.sm,
          right: $styles.insets.sm,
          bottom: $styles.insets.lg,
        ),
        children: const [
          StatsHeader(),
          StoryCountCard(),
          PhotosCard(),
          GlumDistributionCard(),
          WeekDistributionCard(),
          YearInGlumsCard(),
          TagsDistributionCard(),
          TrendingTagsCard(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: const Icon(Icons.search),
      actions: const [Icon(Icons.settings)],
    );
  }
}
