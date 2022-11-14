import 'package:auto_route/annotations.dart';
import 'package:glum_mood_tracker/main.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: [MaterialRoute(page: HomePage, initial: true)],
)
class $AppRouter {}
