import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';
import '../providers/providers.dart';
import 'widgets.dart';

class CardCarousel extends ConsumerWidget {
  const CardCarousel({
    Key? key,
    required this.showCalendar,
  }) : super(key: key);

  final bool showCalendar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref.watch(cardsStateNotifierProvider).maybeMap(
          loadSuccess: (state) => state.cards,
          orElse: () => [],
        );

    final selectedDateTime = ref.watch(dateTimeNotifierProvider).maybeMap(
          data: (selectedDateTime) => selectedDateTime.value,
          orElse: () => DateTime.now(),
        );

    final pageViewController = ref.watch(pageViewControllerProvider);

    return PageView.builder(
      onPageChanged: (index) {
        final selectedYear = selectedDateTime.year;
        final monthYear = DateTime(selectedYear, index + 1);

        ref
            .read(storyNotifierProvider.notifier)
            .watchStoriesByMonthYear(monthYear);
        ref.read(cardFormNotifierProvider.notifier).monthYearChanged(monthYear);
        final card = cards.firstWhereOrNull(
            (card) => card.monthYear.isAtSameMomentAs(monthYear));
        ref.read(cardFormNotifierProvider.notifier).initialiseCard(card);
      },
      controller: pageViewController,
      itemCount: 12,
      itemBuilder: (context, index) {
        final selectedYear = selectedDateTime.year;
        final monthYear = DateTime(selectedYear, index + 1);
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
