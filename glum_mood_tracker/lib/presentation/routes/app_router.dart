import 'package:auto_route/annotations.dart';
import 'package:glum_mood_tracker/main.dart';
import 'package:glum_mood_tracker/presentation/cards/cards_page.dart';

import '../cards/month_page.dart';
import '../stats/stats_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: [
    MaterialRoute(
      page: HomePage,
      initial: true,
      children: [
        MaterialRoute(page: CardsPage),
        MaterialRoute(page: StatsPage),
        MaterialRoute(page: MonthPage),
      ],
    ),
  ],
)
class $AppRouter {}
