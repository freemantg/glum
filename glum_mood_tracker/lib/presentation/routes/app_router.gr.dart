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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../main.dart' as _i1;
import '../cards/cards_page.dart' as _i3;
import '../cards/month_page.dart' as _i4;
import '../stats/stats_page.dart' as _i5;
import 'app_router.dart' as _i2;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    CardsRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    StatsRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    CardsPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CardsPage(),
      );
    },
    MonthPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MonthPage(),
      );
    },
    StatsPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.StatsPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomePageRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              CardsRouter.name,
              path: 'card',
              parent: HomePageRoute.name,
              children: [
                _i6.RouteConfig(
                  CardsPageRoute.name,
                  path: '',
                  parent: CardsRouter.name,
                ),
                _i6.RouteConfig(
                  MonthPageRoute.name,
                  path: ':month',
                  parent: CardsRouter.name,
                ),
              ],
            ),
            _i6.RouteConfig(
              StatsRouter.name,
              path: 'stats',
              parent: HomePageRoute.name,
              children: [
                _i6.RouteConfig(
                  StatsPageRoute.name,
                  path: '',
                  parent: StatsRouter.name,
                )
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i6.PageRouteInfo<void> {
  const HomePageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CardsRouter extends _i6.PageRouteInfo<void> {
  const CardsRouter({List<_i6.PageRouteInfo>? children})
      : super(
          CardsRouter.name,
          path: 'card',
          initialChildren: children,
        );

  static const String name = 'CardsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class StatsRouter extends _i6.PageRouteInfo<void> {
  const StatsRouter({List<_i6.PageRouteInfo>? children})
      : super(
          StatsRouter.name,
          path: 'stats',
          initialChildren: children,
        );

  static const String name = 'StatsRouter';
}

/// generated route for
/// [_i3.CardsPage]
class CardsPageRoute extends _i6.PageRouteInfo<void> {
  const CardsPageRoute()
      : super(
          CardsPageRoute.name,
          path: '',
        );

  static const String name = 'CardsPageRoute';
}

/// generated route for
/// [_i4.MonthPage]
class MonthPageRoute extends _i6.PageRouteInfo<void> {
  const MonthPageRoute()
      : super(
          MonthPageRoute.name,
          path: ':month',
        );

  static const String name = 'MonthPageRoute';
}

/// generated route for
/// [_i5.StatsPage]
class StatsPageRoute extends _i6.PageRouteInfo<void> {
  const StatsPageRoute()
      : super(
          StatsPageRoute.name,
          path: '',
        );

  static const String name = 'StatsPageRoute';
}
