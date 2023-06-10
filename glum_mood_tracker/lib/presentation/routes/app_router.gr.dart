// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    AddStoryRoute.name: (routeData) {
      final args = routeData.argsAs<AddStoryRouteArgs>(
          orElse: () => const AddStoryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddStoryPage(
          key: args.key,
          story: args.story,
        ),
      );
    },
    CardsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CardsPage(),
      );
    },
    MonthRoute.name: (routeData) {
      final args = routeData.argsAs<MonthRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MonthPage(
          key: args.key,
          monthYear: args.monthYear,
        ),
      );
    },
    StoryRoute.name: (routeData) {
      final args = routeData.argsAs<StoryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StoryPage(
          key: args.key,
          story: args.story,
        ),
      );
    },
    StatsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatsPage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddStoryPage]
class AddStoryRoute extends PageRouteInfo<AddStoryRouteArgs> {
  AddStoryRoute({
    Key? key,
    StoryModel? story,
    List<PageRouteInfo>? children,
  }) : super(
          AddStoryRoute.name,
          args: AddStoryRouteArgs(
            key: key,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'AddStoryRoute';

  static const PageInfo<AddStoryRouteArgs> page =
      PageInfo<AddStoryRouteArgs>(name);
}

class AddStoryRouteArgs {
  const AddStoryRouteArgs({
    this.key,
    this.story,
  });

  final Key? key;

  final StoryModel? story;

  @override
  String toString() {
    return 'AddStoryRouteArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [CardsPage]
class CardsRoute extends PageRouteInfo<void> {
  const CardsRoute({List<PageRouteInfo>? children})
      : super(
          CardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MonthPage]
class MonthRoute extends PageRouteInfo<MonthRouteArgs> {
  MonthRoute({
    Key? key,
    required DateTime monthYear,
    List<PageRouteInfo>? children,
  }) : super(
          MonthRoute.name,
          args: MonthRouteArgs(
            key: key,
            monthYear: monthYear,
          ),
          initialChildren: children,
        );

  static const String name = 'MonthRoute';

  static const PageInfo<MonthRouteArgs> page = PageInfo<MonthRouteArgs>(name);
}

class MonthRouteArgs {
  const MonthRouteArgs({
    this.key,
    required this.monthYear,
  });

  final Key? key;

  final DateTime monthYear;

  @override
  String toString() {
    return 'MonthRouteArgs{key: $key, monthYear: $monthYear}';
  }
}

/// generated route for
/// [StoryPage]
class StoryRoute extends PageRouteInfo<StoryRouteArgs> {
  StoryRoute({
    Key? key,
    required StoryModel story,
    List<PageRouteInfo>? children,
  }) : super(
          StoryRoute.name,
          args: StoryRouteArgs(
            key: key,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryRoute';

  static const PageInfo<StoryRouteArgs> page = PageInfo<StoryRouteArgs>(name);
}

class StoryRouteArgs {
  const StoryRouteArgs({
    this.key,
    required this.story,
  });

  final Key? key;

  final StoryModel story;

  @override
  String toString() {
    return 'StoryRouteArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [StatsPage]
class StatsRoute extends PageRouteInfo<void> {
  const StatsRoute({List<PageRouteInfo>? children})
      : super(
          StatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
