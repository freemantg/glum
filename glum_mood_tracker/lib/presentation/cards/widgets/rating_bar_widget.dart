import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

import '../../../shared/providers.dart';

class RatingBarWidget extends ConsumerWidget {
  const RatingBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: _ColorRatingBar(
        onRatingSelected: (rating) {
          ref
              .read(storyFormNotifierProvider.notifier)
              .ratingChanged(rating.toInt());
        },
      ),
    );
  }
}

class _ColorRatingBar extends StatelessWidget {
  final Function(int) onRatingSelected;

  const _ColorRatingBar({Key? key, required this.onRatingSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        5,
        (index) => _buildRatingContainer(
          color: (index + 1).ratingToColor(),
          rating: index + 1,
          onTap: () => onRatingSelected(index + 1),
        ),
      ),
    );
  }

  Widget _buildRatingContainer({
    required Color color,
    required int rating,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: $styles.insets.xxs),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular($styles.insets.xs),
        ),
      ),
    );
  }
}
