import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';

import 'presentation/routes/app_router.gr.dart';
import 'styles/styles.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildStyledAppBar(),
      body: _buildScaffoldBody(context),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user), label: 'Stats'),
        ],
      ),
    );
  }

  Widget _buildScaffoldBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('2022', style: $styles.text.h3),
              const Icon(Icons.keyboard_arrow_down)
            ],
          ),
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            child: const CardCarousel(),
          ),
          const Spacer(),
          const CalendarToggleButton(),
          const Spacer(),
        ],
      ),
    );
  }

  AppBar _buildStyledAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
      actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Center(
              child: Text(
                DateTime.now().dateTimeNowInString,
                style: $styles.text.bodySmallBold,
              ),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

class CardCarousel extends HookWidget {
  const CardCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(viewportFraction: 0.8);

    return PageView.builder(
      controller: pageController,
      itemBuilder: (_, __) {
        return Card(
          margin: EdgeInsets.all($styles.insets.sm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular($styles.corners.lg),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              $styles.insets.sm,
              $styles.insets.md,
              $styles.insets.sm,
              $styles.insets.sm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '11',
                  style: $styles.text.h1,
                ),
                Text(
                  '  NOV',
                  style: $styles.text.h3.copyWith(fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular($styles.corners.sm),
                        child: const LinearProgressIndicator(
                          value: 1 / 30,
                        ),
                      ),
                    ),
                    SizedBox(width: $styles.insets.xs),
                    Text(
                      '1',
                      style: $styles.text.caption
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '/30',
                      style: $styles.text.caption
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                    const Spacer(),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CalendarToggleButton extends StatelessWidget {
  const CalendarToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: $styles.insets.xs,
        horizontal: $styles.insets.lg,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular($styles.corners.lg),
      ),
      child: Text(
        'CALENDAR',
        style: $styles.text.caption.copyWith(height: 0),
      ),
    );
  }
}
