import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/models.dart';
import '../../../styles/styles.dart';
import '../../routes/app_router.dart';

class StyledBottomBar extends StatelessWidget {
  const StyledBottomBar({
    super.key,
    required this.story,
  });

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: $styles.insets.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: $styles.insets.sm),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Transform.scale(
                        scaleX: -1,
                        child: Icon(
                          Icons.sell_outlined,
                          size: 16.0,
                          color: Colors.grey.withOpacity(0.85),
                        ),
                      ),
                      SizedBox(width: $styles.insets.xs),
                      Text(
                        story.tags.map((e) => e.title).toList().join(', '),
                        style: $styles.text.bodySmall.copyWith(
                          color: Colors.white.withOpacity(0.45),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  )),
              const Divider(
                thickness: 0.1,
                height: 0,
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () => context.router
                        .push(AddStoryRoute(story: story))
                        .then((_) => context.popRoute()),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => context.router.pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
