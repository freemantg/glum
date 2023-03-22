import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/styles/colors.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

import '../../../shared/providers.dart';

class RatingBarWidget extends ConsumerWidget {
  const RatingBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ColorRatingBar(
        onRatingSelected: (rating) {
          ref
              .read(storyFormNotifierProvider.notifier)
              .ratingChanged(rating.toInt());
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
        int newRating = 1 +
            (details.localPosition.dx / (MediaQuery.of(context).size.width / 5))
                .floor()
                .clamp(0, 4);
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
            context: context,
            color: currentRating.value != null && index < currentRating.value!
                ? colors[index + 1]
                : Colors.grey.shade300,
            rating: index + 1,
          ),
        ),
      ),
    );
  }

  Widget _buildRatingContainer({
    required BuildContext context,
    required Color color,
    required int rating,
  }) {
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
