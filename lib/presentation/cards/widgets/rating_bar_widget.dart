import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/colors.dart';
import '../../../styles/styles.dart';

class RatingBarWidget extends ConsumerWidget {
  const RatingBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ColorRatingBar(
        onRatingSelected: (rating) {
          ref.read(storyFormNotifierProvider.notifier).ratingChanged(rating);
        },
      ),
    );
  }
}

class ColorRatingBar extends HookWidget {
  final Function(int) onRatingSelected;

  const ColorRatingBar({Key? key, required this.onRatingSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRating = useState<int?>(null);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        final dx = details.localPosition.dx;
        final screenWidth = MediaQuery.of(context).size.width;
        final newRating = ((dx / (screenWidth / 5)).floor() + 1).clamp(1, 5);
        if (newRating != currentRating.value) {
          currentRating.value = newRating;
        }
      },
      onHorizontalDragEnd: (_) {
        if (currentRating.value != null) {
          onRatingSelected(currentRating.value!);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          5,
          (index) => _buildRatingContainer(
            context,
            currentRating.value != null && index < currentRating.value!,
            index + 1,
          ),
        ),
      ),
    );
  }

  Widget _buildRatingContainer(
    BuildContext context,
    bool isFilled,
    int rating,
  ) {
    final color = isFilled ? colors[rating] : Colors.grey.shade300;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: $styles.insets.xxs),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      child: Center(
        child: Text(
          '$rating',
          style: $styles.text.bodySmallBold.copyWith(height: 0),
        ),
      ),
    );
  }
}
