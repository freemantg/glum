import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';
import '../../cards/widgets/tag_bottom_modal_sheet.dart';
import 'widgets.dart';

class PhotosCard extends ConsumerWidget {
  const PhotosCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(photosStateNotifierProvider).photos;
    final insets = $styles.insets;

    return StyledCard(
      customPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(insets.sm),
            child: Row(
              children: [
                Text('Photos', style: $styles.text.bodySmallBold),
                const Spacer(),
                Text(
                  photos.length.toString(),
                  style: $styles.text.bodySmallBold,
                ),
                GestureDetector(
                  child: const Icon(Icons.keyboard_arrow_right),
                  onTap: () => showTagModalBottomSheet(context),
                ),
              ],
            ),
          ),
          ImageViewer(photos: photos),
        ],
      ),
    );
  }
}
