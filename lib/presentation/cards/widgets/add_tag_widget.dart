import 'package:flutter/material.dart';

import 'widgets.dart';

class AddTagWidget extends StatelessWidget {
  const AddTagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Transform.scale(
        scaleX: -1,
        child: Icon(
          Icons.sell_outlined,
          size: 16.0,
          color: Colors.grey.withOpacity(0.85),
        ),
      ),
      onTap: () => showTagModalBottomSheet(context),
    );
  }
}
