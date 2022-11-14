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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../main.dart' as _i1;
import '../cards/cards_page.dart' as _i2;
import '../cards/month_page.dart' as _i4;
import '../stats/stats_page.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    CardsPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CardsPage(),
      );
    },
    StatsPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.StatsPage(),
      );
    },
    MonthPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MonthPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomePageRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              CardsPageRoute.name,
              path: 'cards-page',
              parent: HomePageRoute.name,
            ),
            _i5.RouteConfig(
              StatsPageRoute.name,
              path: 'stats-page',
              parent: HomePageRoute.name,
            ),
            _i5.RouteConfig(
              MonthPageRoute.name,
              path: 'month-page',
              parent: HomePageRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i5.PageRouteInfo<void> {
  const HomePageRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.CardsPage]
class CardsPageRoute extends _i5.PageRouteInfo<void> {
  const CardsPageRoute()
      : super(
          CardsPageRoute.name,
          path: 'cards-page',
        );

  static const String name = 'CardsPageRoute';
}

/// generated route for
/// [_i3.StatsPage]
class StatsPageRoute extends _i5.PageRouteInfo<void> {
  const StatsPageRoute()
      : super(
          StatsPageRoute.name,
          path: 'stats-page',
        );

  static const String name = 'StatsPageRoute';
}

/// generated route for
/// [_i4.MonthPage]
class MonthPageRoute extends _i5.PageRouteInfo<void> {
  const MonthPageRoute()
      : super(
          MonthPageRoute.name,
          path: 'month-page',
        );

  static const String name = 'MonthPageRoute';
}
