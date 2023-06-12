import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import 'widgets.dart';

class StatsHeader extends StatelessWidget {
  const StatsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: $styles.insets.lg),
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
                SizedBox(height: $styles.insets.xxs),
                Text('Stories', style: $styles.text.bodyBold),
                SizedBox(height: $styles.insets.xxs),
                Text(
                  'What matters is the interior',
                  style: $styles.text.caption
                      .copyWith(color: Theme.of(context).disabledColor),
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
              padding: EdgeInsets.all($styles.insets.xs),
              child: Text('🍚', style: $styles.text.h3),
            ),
          ),
        ),
      ],
    );
  }
}