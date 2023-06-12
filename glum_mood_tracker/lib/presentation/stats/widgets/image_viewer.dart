import 'package:flutter/material.dart';

import '../../../domain/models/models.dart';
import '../../../styles/styles.dart';

class ImageViewer extends StatelessWidget {
  final List<PhotoModel> photos;

  const ImageViewer({
    Key? key,
    required this.photos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth =
        MediaQuery.of(context).size.width - $styles.insets.xs;
    final double firstImageWidth = screenWidth / 2;

    return photos.isEmpty
        ? const CircularProgressIndicator()
        : SizedBox(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.file(
                    photos.first.file!,
                    width: firstImageWidth,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                ),
                Positioned.fill(
                  left: firstImageWidth - 15,
                  child: GridView.builder(
                    key: const Key('imageGridView'),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: photos.length - 1,
                    itemBuilder: (context, index) {
                      return Image.file(
                        photos[index + 1].file!,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
