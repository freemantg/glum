// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/foundation.dart' as _i10;
import 'package:flutter/material.dart' as _i9;

import '../../domain/story.dart' as _i11;
import '../../main.dart' as _i1;
import '../cards/add_story_page.dart' as _i3;
import '../cards/cards_page.dart' as _i5;
import '../cards/month_page.dart' as _i6;
import '../cards/story_page.dart' as _i2;
import '../stats/stats_page.dart' as _i7;
import 'app_router.dart' as _i4;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    StoryPageRoute.name: (routeData) {
      final args = routeData.argsAs<StoryPageRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.StoryPage(
          key: args.key,
          story: args.story,
        ),
      );
    },
    AddStoryPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddStoryPageRouteArgs>(
          orElse: () => const AddStoryPageRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.AddStoryPage(
          key: args.key,
          story: args.story,
        ),
      );
    },
    CardsRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    StatsRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    CardsPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CardsPage(),
      );
    },
    MonthPageRoute.name: (routeData) {
      final args = routeData.argsAs<MonthPageRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.MonthPage(
          key: args.key,
          monthYear: args.monthYear,
        ),
      );
    },
    StatsPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.StatsPage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          HomePageRoute.name,
          path: '/',
          children: [
            _i8.RouteConfig(
              CardsRouter.name,
              path: 'card',
              parent: HomePageRoute.name,
              children: [
                _i8.RouteConfig(
                  CardsPageRoute.name,
                  path: '',
                  parent: CardsRouter.name,
                ),
                _i8.RouteConfig(
                  MonthPageRoute.name,
                  path: ':month',
                  parent: CardsRouter.name,
                ),
              ],
            ),
            _i8.RouteConfig(
              StatsRouter.name,
              path: 'stats',
              parent: HomePageRoute.name,
              children: [
                _i8.RouteConfig(
                  StatsPageRoute.name,
                  path: '',
                  parent: StatsRouter.name,
                )
              ],
            ),
          ],
        ),
        _i8.RouteConfig(
          StoryPageRoute.name,
          path: ':story',
        ),
        _i8.RouteConfig(
          AddStoryPageRoute.name,
          path: 'addStory',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i8.PageRouteInfo<void> {
  const HomePageRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.StoryPage]
class StoryPageRoute extends _i8.PageRouteInfo<StoryPageRouteArgs> {
  StoryPageRoute({
    _i10.Key? key,
    required _i11.Story story,
  }) : super(
          StoryPageRoute.name,
          path: ':story',
          args: StoryPageRouteArgs(
            key: key,
            story: story,
          ),
        );

  static const String name = 'StoryPageRoute';
}

class StoryPageRouteArgs {
  const StoryPageRouteArgs({
    this.key,
    required this.story,
  });

  final _i10.Key? key;

  final _i11.Story story;

  @override
  String toString() {
    return 'StoryPageRouteArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [_i3.AddStoryPage]
class AddStoryPageRoute extends _i8.PageRouteInfo<AddStoryPageRouteArgs> {
  AddStoryPageRoute({
    _i10.Key? key,
    _i11.Story? story,
  }) : super(
          AddStoryPageRoute.name,
          path: 'addStory',
          args: AddStoryPageRouteArgs(
            key: key,
            story: story,
          ),
        );

  static const String name = 'AddStoryPageRoute';
}

class AddStoryPageRouteArgs {
  const AddStoryPageRouteArgs({
    this.key,
    this.story,
  });

  final _i10.Key? key;

  final _i11.Story? story;

  @override
  String toString() {
    return 'AddStoryPageRouteArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [_i4.EmptyRouterPage]
class CardsRouter extends _i8.PageRouteInfo<void> {
  const CardsRouter({List<_i8.PageRouteInfo>? children})
      : super(
          CardsRouter.name,
          path: 'card',
          initialChildren: children,
        );

  static const String name = 'CardsRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class StatsRouter extends _i8.PageRouteInfo<void> {
  const StatsRouter({List<_i8.PageRouteInfo>? children})
      : super(
          StatsRouter.name,
          path: 'stats',
          initialChildren: children,
        );

  static const String name = 'StatsRouter';
}

/// generated route for
/// [_i5.CardsPage]
class CardsPageRoute extends _i8.PageRouteInfo<void> {
  const CardsPageRoute()
      : super(
          CardsPageRoute.name,
          path: '',
        );

  static const String name = 'CardsPageRoute';
}

/// generated route for
/// [_i6.MonthPage]
class MonthPageRoute extends _i8.PageRouteInfo<MonthPageRouteArgs> {
  MonthPageRoute({
    _i10.Key? key,
    required DateTime monthYear,
  }) : super(
          MonthPageRoute.name,
          path: ':month',
          args: MonthPageRouteArgs(
            key: key,
            monthYear: monthYear,
          ),
        );

  static const String name = 'MonthPageRoute';
}

class MonthPageRouteArgs {
  const MonthPageRouteArgs({
    this.key,
    required this.monthYear,
  });

  final _i10.Key? key;

  final DateTime monthYear;

  @override
  String toString() {
    return 'MonthPageRouteArgs{key: $key, monthYear: $monthYear}';
  }
}

/// generated route for
/// [_i7.StatsPage]
class StatsPageRoute extends _i8.PageRouteInfo<void> {
  const StatsPageRoute()
      : super(
          StatsPageRoute.name,
          path: '',
        );

  static const String name = 'StatsPageRoute';
}
