import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';

import '../../../shared/constants.dart';
import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import 'widgets.dart';

class YearInGlumsCard extends StatelessWidget {
  const YearInGlumsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      customPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildTable(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: Text('Year in Glums', style: $styles.text.bodySmallBold),
    );
  }

  Widget _buildTable() {
    return Table(
      children: [
        _buildMonthInitialsRow(),
        for (int i = 1; i <= 31; i++) _buildDayRow(i),
      ],
    );
  }

  TableRow _buildMonthInitialsRow() {
    return TableRow(
      children: [
        const Text(''),
        ...monthInitials.map(
          (e) => TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text(
              e,
              textAlign: TextAlign.center,
              style: $styles.text.caption,
            ),
          ),
        )
      ],
    );
  }

  TableRow _buildDayRow(int day) {
    return TableRow(
      children: [
        _buildDayNumber(day),
        for (int j = 1; j <= 12; j++)
          _buildYearIndividualGlum(day: day, month: j),
      ],
    );
  }

  Widget _buildDayNumber(int day) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Text(
        day.toString(),
        textAlign: TextAlign.center,
        style: $styles.text.caption,
      ),
    );
  }

  Widget _buildYearIndividualGlum({required int day, required int month}) {
    return Consumer(
      builder: (context, ref, child) {
        final yearInGlumsMap = ref.watch(statsNotifierProvider).yearInGlums;
        final currentYear = DateTime.now().year;
        final glumRating = yearInGlumsMap[DateTime(currentYear, month, day)];
        return _buildGlumRatingBox(glumRating);
      },
    );
  }

  Widget _buildGlumRatingBox(int? glumRating) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: (glumRating != null) ? glumRating.ratingToColor() : null,
          border: Border.all(
            width: 0.5,
            color: const Color(0xFFDB6162).withOpacity(0.2),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(2.0)),
        ),
        child: (glumRating != null)
            ? Center(child: Text(glumRating.toString()))
            : const SizedBox.shrink(),
      ),
    );
  }
}
