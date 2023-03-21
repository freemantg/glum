
import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class StyledCard extends StatelessWidget {
  const StyledCard({
    super.key,
    required this.child,
    this.customPadding = false,
  });

  final Widget child;
  final bool customPadding;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: $styles.colors.cardColor,
      surfaceTintColor: $styles.colors.cardColor,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular($styles.corners.md * 1.5)),
      ),
      child: Padding(
        padding: customPadding
            ? const EdgeInsets.all(0)
            : EdgeInsets.all($styles.insets.sm),
        child: child,
      ),
    );
  }
}
