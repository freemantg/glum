import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

import 'presentation/routes/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: $styles.primaryThemeColor,
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            iconTheme: IconThemeData(),
            elevation: 0.0,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        CardsRoute(),
        StatsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: tabsRouter.activeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chrome_reader_mode),
              label: 'Cards',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_timeline_outlined),
              label: 'Stats',
            )
          ],
          onTap: (index) => tabsRouter.setActiveIndex(index),
        );
      },
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => AutoRouter.of(context).push(AddStoryRoute()),
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
