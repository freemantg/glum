import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';
import '../providers/providers.dart';
import 'widgets.dart';

class CardCarousel extends ConsumerWidget {
  const CardCarousel({
    super.key,
    required this.showCalendar,
  });

  final bool showCalendar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref.watch(cardsStateNotifierProvider).maybeMap(
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
            .read(storyNotifierProvider.notifier)
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
