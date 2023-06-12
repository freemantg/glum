import 'package:flutter/material.dart';

import '../../../domain/models/models.dart';
import '../../../styles/styles.dart';

class TitleAndDescriptionWidget extends StatelessWidget {
  const TitleAndDescriptionWidget({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const QuotationDecal(),
        Padding(
          padding: EdgeInsets.all($styles.insets.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                story.title,
                style: $styles.text.bodySmallBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: $styles.insets.xxs),
              Text(
                story.description,
                style: $styles.text.caption.copyWith(
                  color: Colors.white70,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: QuotationDecal(),
        ),
      ],
    );
  }
}

class QuotationDecal extends StatelessWidget {
  const QuotationDecal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.xs),
      child: Text(
        '"',
        style: $styles.text.h3.copyWith(color: Colors.white70),
      ),
    );
  }
}
