import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:glum_mood_tracker/presentation/cards/providers/providers.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:glum_mood_tracker/styles/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../styles/styles.dart';
import '../routes/app_router.gr.dart';

class CardsPage extends ConsumerStatefulWidget {
  const CardsPage({super.key});

  @override
  ConsumerState<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends ConsumerState<CardsPage> {
  @override
  void initState() {
    Future.microtask(
        () => ref.read(storiesNotifierProvider.notifier).watchStoryStream());
    super.initState();
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
    void showPickYearDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => const StyledYearPickerAlertDialog(),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () => showPickYearDialog(context),
                child: Text(
                    ref.watch(dateTimeNotifierProvider).maybeMap(
                          data: (selectedDate) =>
                              selectedDate.value.year.toString(),
                          orElse: () => 'No',
                        ),
                    style: $styles.text.h3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(width: 82.0),
                  Icon(Icons.keyboard_arrow_down),
                ],
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.7,
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

class StyledYearPickerAlertDialog extends ConsumerWidget {
  const StyledYearPickerAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final currentYear = DateTime.now().year;

    return AlertDialog(
      title: const Text('Select a Year'),
      contentPadding: const EdgeInsets.all(10),
      content: SizedBox(
        height: size.height / 3,
        width: size.width,
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            ...List.generate(
              currentYear - 2000,
              (index) => InkWell(
                onTap: () {
                  ref
                      .read(dateTimeNotifierProvider.notifier)
                      .updateSelectedDateTime(DateTime(currentYear - index));
                  context.popRoute();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    label: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text((currentYear - index).toString()),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
                  style: $styles.text.bodySmallBold,
                ),
              ),
            ),
            onTap: () {
              ref
                  .read(dateTimeNotifierProvider.notifier)
                  .updateSelectedDateTime(today);
              ref.read(pageViewControllerProvider).animateToPage(
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
      controller: ref.watch(pageViewControllerProvider),
      itemCount: 12,
      itemBuilder: (context, index) => MonthCard(
        index + 1,
        showCalendar: showCalendar,
        monthYear: DateTime(2022, index + 1),
      ),
    );
  }
}

class MonthCard extends ConsumerWidget {
  const MonthCard(
    this.month, {
    super.key,
    required this.showCalendar,
    required this.monthYear,
  });

  final int month;
  final bool showCalendar;
  final DateTime monthYear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.pushRoute(const MonthPageRoute()),
      child: Card(
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
                children: [
                  Text(
                    month.toString(),
                    style: $styles.text.h1,
                  ),
                  Text(
                    '  ${DateFormat.MMM().format(DateTime(monthYear.year, monthYear.month)).toUpperCase()}',
                    style:
                        $styles.text.h3.copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const Spacer(),
              showCalendar
                  ? StyledMonthCalendar(monthYear: monthYear)
                  : const MonthProgressBar(),
              showCalendar ? const Spacer() : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class StyledMonthCalendar extends StatelessWidget {
  const StyledMonthCalendar({
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
          itemCount: firstDayOfMonthOffset + daysInMonth,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (context, index) {
            if (index + 1 > firstDayOfMonthOffset) {
              return GestureDetector(
                onTap: () => context.router.push(const StoryPageRoute()),
                child: Text(
                  ((index + 1) - firstDayOfMonthOffset).toString(),
                  textAlign: TextAlign.center,
                  style: $styles.text.bodySmall,
                ),
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

class MonthProgressBar extends StatelessWidget {
  const MonthProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          style: $styles.text.caption.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '/30',
          style: $styles.text.caption.copyWith(fontWeight: FontWeight.w300),
        ),
        const Spacer(),
        GestureDetector(
          child: const Icon(Icons.more_horiz),
          onTap: () => showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular($styles.corners.md)),
            ),
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: $styles.insets.md,
                  vertical: $styles.insets.xs,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'PHOTO',
                          style: $styles.text.bodySmallBold,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_right),
                        )
                      ],
                    ),
                    const Divider(),
                    SizedBox(height: $styles.insets.xs),
                    Text(
                      'COLOUR',
                      style: $styles.text.bodySmallBold,
                    ),
                    SizedBox(height: $styles.insets.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(
                          colors.length,
                          (index) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors[index],
                            ),
                            height: 42.0,
                            width: 42.0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: $styles.insets.xl),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CalendarToggleButton extends HookWidget {
  const CalendarToggleButton({
    super.key,
    required this.showCalendar,
    required this.toggleCalendar,
  });

  final bool showCalendar;
  final void Function() toggleCalendar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCalendar,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: $styles.insets.xs,
          horizontal: $styles.insets.lg,
        ),
        decoration: BoxDecoration(
          color: showCalendar
              ? Theme.of(context).disabledColor
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular($styles.corners.lg),
        ),
        child: Text(
          showCalendar ? 'MONTH' : 'CALENDAR',
          style: $styles.text.caption.copyWith(height: 0),
        ),
      ),
    );
  }
}
