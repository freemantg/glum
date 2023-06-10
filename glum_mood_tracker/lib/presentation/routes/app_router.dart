import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/models/models.dart';
import '../../main.dart';
import '../cards/add_story_page.dart';
import '../cards/cards_page.dart';
import '../cards/month_page.dart';
import '../cards/story_page.dart';
import '../stats/stats_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          children: [
            AutoRoute(page: CardsRoute.page),
            AutoRoute(page: StatsRoute.page),
          ],
        ),
        AutoRoute(page: StoryRoute.page),
        AutoRoute(page: AddStoryRoute.page),
        AutoRoute(page: MonthRoute.page),
      ];
}
