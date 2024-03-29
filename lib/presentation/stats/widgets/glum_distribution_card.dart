import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import 'widgets.dart';

class GlumDistributionCard extends ConsumerWidget {
  const GlumDistributionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glumDistribution =
        ref.watch(statsNotifierProvider).storyStats.glumDistribution;
    final totalGlumCount =
        glumDistribution.values.fold<int>(0, (x, y) => x + y);

    final insets = $styles.insets;

    const heightFactor = 0.5;
    const doughnutChartHeight = 250.0;

    return StyledCard(
      customPadding: true,
      child: Padding(
        padding: EdgeInsets.all(insets.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Glum Count', style: $styles.text.bodySmallBold),
            Align(
              alignment: Alignment.topCenter,
              heightFactor: heightFactor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  DoughnutChart(
                    data: glumDistribution.values.toList(),
                    width: doughnutChartHeight,
                    height: doughnutChartHeight,
                  ),
                  Positioned(
                    bottom: doughnutChartHeight * heightFactor,
                    child: Column(
                      children: [
                        Text(totalGlumCount.toString(), style: $styles.text.h2),
                        Text('Total glums', style: $styles.text.caption),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: insets.md),
            ...glumDistribution.entries.map(
              (e) => GlumCountPercentageBar(
                glumRating: e.key,
                count: e.value,
                totalGlums: totalGlumCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
