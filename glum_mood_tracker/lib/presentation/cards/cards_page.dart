import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:glum_mood_tracker/presentation/cards/providers/providers.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/story.dart';
import '../../styles/styles.dart';
import '../routes/app_router.gr.dart';
import 'widgets/calendar_toggle_button.dart';
import 'widgets/cards_visual_options_button.dart';
import 'widgets/year_selector_button.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildStyledAppBar(),
      body: const CardPageBody(),
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
          const Spacer(),
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

AppBar _buildStyledAppBar() {
  final today = DateTime.now();

  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {},
    ),
    actions: [
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Center(
                child: Text(
                  today.dateTimeNowInString,
                  style: $styles.text.bodySmallBold.copyWith(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            onTap: () {
              ref
                  .read(dateTimeNotifierProvider.notifier)
                  .updateSelectedDateTime(today);
              ref.read(pageViewControllerProvider).animateToPage(
                    //PageView index starts at 0. Months start at 1.
                    today.month - 1,
                    duration: kThemeAnimationDuration,
                    curve: Curves.easeIn,
                  );
            },
          );
        },
      ),
    ],
  );
}

class CardCarousel extends ConsumerWidget {
  const CardCarousel({
    super.key,
    required this.showCalendar,
  });

  final bool showCalendar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
      onPageChanged: (index) {
        final monthYear = ref.watch(dateTimeNotifierProvider).maybeMap(
              data: (selectedDateTime) {
                final selectedYear = selectedDateTime.value.year;
                return DateTime(selectedYear, index + 1);
              },
              orElse: () => DateTime.now(),
            );
        ref
            .read(storiesNotifierProvider.notifier)
            .watchStoriesByMonthYear(monthYear);
      },
      controller: ref.watch(pageViewControllerProvider),
      itemCount: 12,
      itemBuilder: (context, index) {
        final monthYear = ref.watch(dateTimeNotifierProvider).maybeMap(
              data: (selectedDateTime) {
                final selectedYear = selectedDateTime.value.year;
                return DateTime(selectedYear, index + 1);
              },
              orElse: () => DateTime.now(),
            );
        return MonthCard(
          showCalendar: showCalendar,
          monthYear: monthYear,
        );
      },
    );
  }
}

class MonthCard extends StatelessWidget {
  const MonthCard({
    super.key,
    required this.showCalendar,
    required this.monthYear,
  });

  final bool showCalendar;
  final DateTime monthYear;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(MonthPageRoute(monthYear: monthYear)),
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.all($styles.insets.sm),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular($styles.corners.md)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            $styles.insets.sm,
            $styles.insets.md,
            $styles.insets.sm,
            $styles.insets.sm,
          ),
          child: Column(
            crossAxisAlignment: showCalendar
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(monthYear.month.toString(), style: $styles.text.h1),
                  Text(
                    DateFormat.MMM()
                        .format(DateTime(monthYear.year, monthYear.month))
                        .toUpperCase(),
                    style: $styles.text.h3.copyWith(
                      height: 0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              showCalendar
                  ? StyledMonthViewCalendar(monthYear: monthYear)
                  : MonthProgressBar(monthYear: monthYear),
              showCalendar ? const Spacer() : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class StyledMonthViewCalendar extends StatelessWidget {
  const StyledMonthViewCalendar({
    super.key,
    required this.monthYear,
  });

  final DateTime monthYear;

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
        DateUtils.getDaysInMonth(monthYear.year, monthYear.month);

    final firstDayOfMonthOffset = DateUtils.firstDayOffset(
      monthYear.year,
      monthYear.month,
      const DefaultMaterialLocalizations(),
    );

    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: firstDayOfMonthOffset + daysInMonth,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (context, index) {
            if (index + 1 > firstDayOfMonthOffset) {
              return DateButton(
                firstDayOfMonthOffset: firstDayOfMonthOffset,
                monthYear: monthYear,
                dateIndex: index,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        SizedBox(height: $styles.insets.sm),
        Text(
          'Select a date to write',
          style: $styles.text.bodySmallBold.copyWith(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        SizedBox(height: $styles.insets.sm),
      ],
    );
  }
}

class DateButton extends ConsumerWidget {
  const DateButton({
    super.key,
    required this.dateIndex,
    required this.monthYear,
    required this.firstDayOfMonthOffset,
  });

  final int dateIndex;
  final DateTime monthYear;
  final int firstDayOfMonthOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonDay = (dateIndex + 1) - firstDayOfMonthOffset;
    final buttonDate = DateTime(monthYear.year, monthYear.month, buttonDay);

    final story = ref.watch(storiesNotifierProvider).maybeWhen(
          loadSuccess: (stories) {
            return stories.firstWhere(
              (story) => DateUtils.isSameDay(story.date, buttonDate),
              orElse: () => Story.empty().copyWith(date: buttonDate),
            );
          },
          orElse: () => Story.empty(),
        );

    return GestureDetector(
      onTap: () {
        if (story.id == null) {
          context.router.push(AddStoryPageRoute(story: story));
        } else {
          context.router.push(StoryPageRoute(story: story));
        }
      },
      child: Text(
        buttonDay.toString(),
        textAlign: TextAlign.center,
        style: (story.id == null)
            ? $styles.text.bodySmall.copyWith(color: Colors.grey)
            : $styles.text.bodySmall.copyWith(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
      ),
    );
  }
}

class MonthProgressBar extends ConsumerWidget {
  final DateTime monthYear;
  const MonthProgressBar({
    super.key,
    required this.monthYear,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daysInMonth =
        DateUtils.getDaysInMonth(monthYear.year, monthYear.month);

    final stories = ref.watch(storiesNotifierProvider).maybeWhen(
          loadSuccess: (stories) {
            return stories
                .where((story) => DateUtils.isSameMonth(story.date, monthYear))
                .length;
          },
          orElse: () => 0,
        );

    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular($styles.corners.sm),
            child: LinearProgressIndicator(value: stories / daysInMonth),
          ),
        ),
        SizedBox(width: $styles.insets.xs),
        Text(
          '$stories',
          style: $styles.text.caption.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '/$daysInMonth',
          style: $styles.text.caption.copyWith(fontWeight: FontWeight.w300),
        ),
        const Spacer(),
        const CardVisualOptionsButton(),
      ],
    );
  }
}
