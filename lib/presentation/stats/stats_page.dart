import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers.dart';
import '../../styles/styles.dart';
import 'widgets/widgets.dart';

@RoutePage()
class StatsPage extends HookConsumerWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() => _fetchData(ref));
      return null;
    }, []);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildStatsList(),
    );
  }

  void _fetchData(WidgetRef ref) async {
    final statsNotifier = ref.read(statsNotifierProvider.notifier);
    final photosStateNotifier = ref.read(photosStateNotifierProvider.notifier);

    await Future.wait([
      statsNotifier.fetchStats(),
      photosStateNotifier.getAllPhotos(),
    ]);
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: _buildIconButton(Icons.search),
      actions: [_buildIconButton(Icons.settings)],
    );
  }

  Widget _buildIconButton(IconData iconData) {
    return Icon(iconData);
  }

  Widget _buildStatsList() {
    return ListView(
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
    );
  }
}
