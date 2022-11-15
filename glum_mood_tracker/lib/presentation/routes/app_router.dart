import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:glum_mood_tracker/main.dart';
import 'package:glum_mood_tracker/presentation/cards/cards_page.dart';
import 'package:glum_mood_tracker/presentation/cards/month_page.dart';
import 'package:glum_mood_tracker/presentation/stats/stats_page.dart';

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
            AutoRoute(
              path: ':month',
              page: MonthPage,
            )
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
  ],
)
class $AppRouter {}

class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({Key? key}) : super(key: key);
}

class EmptyRouterScreen extends AutoRouter {
  const EmptyRouterScreen({Key? key}) : super(key: key);
}
