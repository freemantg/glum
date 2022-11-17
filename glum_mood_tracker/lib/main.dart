import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/routes/app_router.gr.dart';

void main() {
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
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        CardsRouter(),
        StatsRouter(),
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
              icon: Icon(Icons.person),
              label: 'Stats',
            )
          ],
          onTap: (index) => tabsRouter.setActiveIndex(index),
        );
      },
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => AutoRouter.of(context).push(const AddStoryPageRoute()),
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
