import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class StyledCard extends StatelessWidget {
  const StyledCard({
    Key? key,
    required this.child,
    this.customPadding = false,
  }) : super(key: key);

  final Widget child;
  final bool customPadding;

  @override
  Widget build(BuildContext context) {
    final insets = $styles.insets;

    return Card(
      color: $styles.cardColor,
      surfaceTintColor: $styles.cardColor,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular($styles.corners.md * 1.5),
        ),
      ),
      child: Padding(
        padding: customPadding ? EdgeInsets.zero : EdgeInsets.all(insets.sm),
        child: child,
      ),
    );
  }
}
