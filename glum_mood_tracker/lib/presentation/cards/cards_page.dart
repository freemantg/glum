import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:glum_mood_tracker/presentation/cards/providers/providers.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/story.dart';
import '../../styles/styles.dart';
import '../routes/app_router.gr.dart';
import 'widgets/calendar_toggle_button.dart';
import 'widgets/cards_visual_options_button.dart';
import 'widgets/month_card.dart';
import 'widgets/year_selector_button.dart';

class CardsPage extends ConsumerStatefulWidget {
  const CardsPage({super.key});

  @override
  ConsumerState<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends ConsumerState<CardsPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.watch(cardsNotifier.notifier).watchAllCards();
    });
  }

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
    actions: [
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
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
                    //PageView index starts at 0. Months start at 1.
                    today.month - 1,
                    duration: kThemeAnimationDuration,
                    curve: Curves.easeIn,
                  );
            },
          );
        },
      ),
      const Spacer(),
      IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {},
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
    final cards = ref.watch(cardsNotifier).maybeMap(
          loadSuccess: (state) {
            return state.cards;
          },
          orElse: () => List.empty(),
        );

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
        ref.read(cardFormNotifierProvider.notifier).monthYearChanged(monthYear);
        final card = cards.firstWhereOrNull(
            (card) => card.monthYear.isAtSameMomentAs(monthYear));
        ref.read(cardFormNotifierProvider.notifier).initialiseCard(card);
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
        final card = cards.firstWhereOrNull(
            (card) => card.monthYear.isAtSameMomentAs(monthYear));
        return MonthCard(
          showCalendar: showCalendar,
          monthYear: monthYear,
          card: card,
        );
      },
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
          style: $styles.text.caption.copyWith(color: Colors.white70),
        ),
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
            ? $styles.text.bodySmall
                .copyWith(color: Theme.of(context).disabledColor)
            : $styles.text.bodySmall.copyWith(
                color: $styles.colors.primaryThemeColor,
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
            child: LinearProgressIndicator(
              value: stories / daysInMonth,
              backgroundColor: Colors.white70.withOpacity(0.25),
              valueColor: AlwaysStoppedAnimation<Color>(
                $styles.colors.primaryThemeColor,
              ),
            ),
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
