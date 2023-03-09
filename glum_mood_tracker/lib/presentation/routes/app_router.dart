import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:glum_mood_tracker/main.dart';
import 'package:glum_mood_tracker/presentation/cards/add_story_page.dart';
import 'package:glum_mood_tracker/presentation/cards/cards_page.dart';
import 'package:glum_mood_tracker/presentation/stats/stats_page.dart';

import '../cards/month_page.dart';
import '../cards/story_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: [
    AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'card',
          name: 'CardsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: CardsPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'stats',
          name: 'StatsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: StatsPage,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: ':story',
      page: StoryPage,
    ),
    AutoRoute(
      path: 'addStory',
      page: AddStoryPage,
    ),
    AutoRoute(
      path: ':month',
      page: MonthPage,
    ),
  ],
)
class $AppRouter {}

class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({Key? key}) : super(key: key);
}

class EmptyRouterScreen extends AutoRouter {
  const EmptyRouterScreen({Key? key}) : super(key: key);
}
