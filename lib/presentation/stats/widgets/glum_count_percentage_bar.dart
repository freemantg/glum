import 'package:flutter/material.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';

import '../../../styles/styles.dart';

class GlumCountPercentageBar extends StatelessWidget {
  const GlumCountPercentageBar({
    Key? key,
    required this.glumRating,
    required this.count,
    required this.totalGlums,
  }) : super(key: key);

  final int glumRating;
  final int count;
  final int totalGlums;

  @override
  Widget build(BuildContext context) {
    final insets = $styles.insets;
    final corners = $styles.corners;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: insets.xs,
        horizontal: insets.xxs,
      ),
      child: SizedBox(
        height: 24.0,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(insets.xxs),
                decoration: BoxDecoration(
                  color: glumRating.ratingToColor(),
                  borderRadius: BorderRadius.all(
                    Radius.circular(corners.sm),
                  ),
                ),
                child: Text(glumRating.toString()),
              ),
            ),
            SizedBox(width: insets.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),
                    child: LinearProgressIndicator(
                      value: count / totalGlums,
                      backgroundColor:
                          glumRating.ratingToColor().withOpacity(0.25),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          glumRating.ratingToColor()),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        glumRating.ratingToLabel(),
                        style: $styles.text.caption.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '$count / ${(count / totalGlums * 100).toInt()}%',
                        style: $styles.text.caption.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
