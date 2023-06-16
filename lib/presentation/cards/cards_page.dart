import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:glum_mood_tracker/presentation/cards/providers/providers.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../styles/styles.dart';
import 'widgets/widgets.dart';

@RoutePage()
class CardsPage extends HookConsumerWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarDateWidget(DateTime.now()),
          const Spacer(),
          const Icon(Icons.settings),
        ],
      ),
      body: const CardPageBody(),
    );
  }
}

class AppBarDateWidget extends ConsumerWidget {
  final DateTime today;

  const AppBarDateWidget(this.today, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(
          top: $styles.insets.sm,
          left: $styles.insets.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              today.dateTimeNowInString,
              style: $styles.text.bodySmallBold,
            ),
            Text(
              today.dateTimeInDayLongFormat,
              style: $styles.text.caption,
            ),
          ],
        ),
      ),
      onTap: () {
        ref
            .read(dateTimeNotifierProvider.notifier)
            .updateSelectedDateTime(today);
        ref.read(pageViewControllerProvider).animateToPage(
              // PageView index starts at 0. Months start at 1.
              today.month - 1,
              duration: kThemeAnimationDuration,
              curve: Curves.easeIn,
            );
      },
    );
  }
}

class CardPageBody extends HookConsumerWidget {
  const CardPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var showCalendar = useState(false);

    void toggleCalendar() => showCalendar.value = !showCalendar.value;

    return SafeArea(
      child: Column(
        children: [
          ...[for (var i = 0; i < 3; i += 1) const Spacer()],
          const YearSelectorButton(),
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            child: CardCarousel(showCalendar: showCalendar.value),
          ),
          const Spacer(),
          CalendarToggleButton(
            showCalendar: showCalendar.value,
            toggleCalendar: toggleCalendar,
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
