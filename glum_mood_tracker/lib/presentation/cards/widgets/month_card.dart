import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:intl/intl.dart';

import '../../../styles/styles.dart';
import '/../domain/card.dart' as domain;
import '../../routes/app_router.gr.dart';
import '../cards_page.dart';

class MonthCard extends ConsumerStatefulWidget {
  const MonthCard({
    Key? key,
    required this.showCalendar,
    required this.card,
  }) : super(key: key);

  final bool showCalendar;
  final domain.Card card;

  @override
  ConsumerState<MonthCard> createState() => _MonthCardState();
}

class _MonthCardState extends ConsumerState<MonthCard> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .watch(cardFormNotifierProvider.notifier)
        .initialiseCard(widget.card));
  }

  @override
  Widget build(BuildContext context) {
    final cardState = ref.watch(cardFormNotifierProvider).card;

    return GestureDetector(
      onTap: () =>
          context.pushRoute(MonthPageRoute(monthYear: widget.card.monthYear)),
      child: Card(
        color: widget.card.color,
        elevation: 8,
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
            crossAxisAlignment: widget.showCalendar
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text('FORM STATE DATE ${widget.card.monthYear.toString()}'),
              Text('PASSED IN CARD DATE ${widget.card.monthYear.toString()}'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.card.monthYear.month.toString(),
                      style: $styles.text.h1),
                  Text(
                    DateFormat.MMM()
                        .format(DateTime(widget.card.monthYear.year,
                            widget.card.monthYear.month))
                        .toUpperCase(),
                    style: $styles.text.h3.copyWith(
                      height: 0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              widget.showCalendar
                  ? StyledMonthViewCalendar(monthYear: widget.card.monthYear)
                  : MonthProgressBar(monthYear: widget.card.monthYear),
              widget.showCalendar ? const Spacer() : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
