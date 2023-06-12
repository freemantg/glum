import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import 'widgets.dart';

class StatsHeader extends StatelessWidget {
  const StatsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final insets = $styles.insets; // Extracted for reuse

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: insets.lg),
          child: StyledCard(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.edit,
                    size: 12,
                  ),
                ),
                SizedBox(height: insets.xxs),
                Text('Stories', style: $styles.text.bodyBold),
                SizedBox(height: insets.xxs),
                Text(
                  'What matters is the interior',
                  style: $styles.text.caption.copyWith(
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular($styles.corners.md),
            ),
            color: $styles.primaryThemeColor,
            child: Padding(
              padding: EdgeInsets.all(insets.xs),
              child: Text('🍚', style: $styles.text.h3),
            ),
          ),
        ),
      ],
    );
  }
}
