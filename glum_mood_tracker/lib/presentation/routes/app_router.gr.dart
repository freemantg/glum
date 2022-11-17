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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/foundation.dart' as _i9;
import 'package:flutter/material.dart' as _i8;

import '../../main.dart' as _i1;
import '../cards/cards_page.dart' as _i4;
import '../cards/month_page.dart' as _i5;
import '../cards/story_page.dart' as _i2;
import '../stats/stats_page.dart' as _i6;
import 'app_router.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    StoryPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.StoryPage(),
      );
    },
    CardsRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    StatsRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    CardsPageRoute.name: (routeData) {
      final args = routeData.argsAs<CardsPageRouteArgs>(
          orElse: () => const CardsPageRouteArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CardsPage(key: args.key),
      );
    },
    MonthPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.MonthPage(),
      );
    },
    StatsPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.StatsPage(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          HomePageRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              CardsRouter.name,
              path: 'card',
              parent: HomePageRoute.name,
              children: [
                _i7.RouteConfig(
                  CardsPageRoute.name,
                  path: '',
                  parent: CardsRouter.name,
                ),
                _i7.RouteConfig(
                  MonthPageRoute.name,
                  path: ':month',
                  parent: CardsRouter.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              StatsRouter.name,
              path: 'stats',
              parent: HomePageRoute.name,
              children: [
                _i7.RouteConfig(
                  StatsPageRoute.name,
                  path: '',
                  parent: StatsRouter.name,
                )
              ],
            ),
          ],
        ),
        _i7.RouteConfig(
          StoryPageRoute.name,
          path: ':story',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i7.PageRouteInfo<void> {
  const HomePageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.StoryPage]
class StoryPageRoute extends _i7.PageRouteInfo<void> {
  const StoryPageRoute()
      : super(
          StoryPageRoute.name,
          path: ':story',
        );

  static const String name = 'StoryPageRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class CardsRouter extends _i7.PageRouteInfo<void> {
  const CardsRouter({List<_i7.PageRouteInfo>? children})
      : super(
          CardsRouter.name,
          path: 'card',
          initialChildren: children,
        );

  static const String name = 'CardsRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class StatsRouter extends _i7.PageRouteInfo<void> {
  const StatsRouter({List<_i7.PageRouteInfo>? children})
      : super(
          StatsRouter.name,
          path: 'stats',
          initialChildren: children,
        );

  static const String name = 'StatsRouter';
}

/// generated route for
/// [_i4.CardsPage]
class CardsPageRoute extends _i7.PageRouteInfo<CardsPageRouteArgs> {
  CardsPageRoute({_i9.Key? key})
      : super(
          CardsPageRoute.name,
          path: '',
          args: CardsPageRouteArgs(key: key),
        );

  static const String name = 'CardsPageRoute';
}

class CardsPageRouteArgs {
  const CardsPageRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'CardsPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.MonthPage]
class MonthPageRoute extends _i7.PageRouteInfo<void> {
  const MonthPageRoute()
      : super(
          MonthPageRoute.name,
          path: ':month',
        );

  static const String name = 'MonthPageRoute';
}

/// generated route for
/// [_i6.StatsPage]
class StatsPageRoute extends _i7.PageRouteInfo<void> {
  const StatsPageRoute()
      : super(
          StatsPageRoute.name,
          path: '',
        );

  static const String name = 'StatsPageRoute';
}
