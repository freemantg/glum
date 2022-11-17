import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

class AddStoryPage extends StatelessWidget {
  const AddStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        children: [
          Container(
            color: Colors.white.withOpacity(0.1),
            height: MediaQuery.of(context).size.height / 2.5,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_a_photo,
                color: Color(0xFFDA736E),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: $styles.insets.sm,
              horizontal: $styles.insets.lg,
            ),
            child: Column(
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  style: $styles.text.h3.copyWith(fontSize: 18.0),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                  ),
                ),
                const Divider(height: 0),
                SizedBox(height: $styles.insets.xs),
                Row(
                  children: [
                    const Spacer(flex: 3),
                    RatingBar(
                      minRating: 1,
                      itemSize: 24.0,
                      itemPadding:
                          EdgeInsets.symmetric(horizontal: $styles.insets.xxs),
                      onRatingUpdate: (rating) {},
                      ratingWidget: RatingWidget(
                        full: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFE35062),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          height: 16.0,
                          width: 16.0,
                        ),
                        half: const SizedBox.shrink(),
                        empty: Container(
                          decoration: BoxDecoration(
                            color: const Color(0XFFC17D35).withOpacity(0.25),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          height: 16.0,
                          width: 16.0,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: Icon(
                        Icons.tag,
                        color: Colors.grey.withOpacity(0.85),
                      ),
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        useSafeArea: true,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular($styles.corners.md),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return Scaffold(
                            appBar: AppBar(
                              centerTitle: true,
                              title: Text(
                                'Tags',
                                style:
                                    $styles.text.bodyBold.copyWith(height: 0),
                              ),
                              actions: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.sort),
                                ),
                              ],
                            ),
                            body: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {},
                                  leading: Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                  title: Row(
                                    children: [
                                      Text('Tag', style: $styles.text.bodyBold),
                                      const Spacer(),
                                      Text(
                                        '5',
                                        style: $styles.text.bodyBold
                                            .copyWith(height: 0),
                                      )
                                    ],
                                  ),
                                  trailing: const Icon(Icons.more_vert),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Divider(),
                SizedBox(height: $styles.insets.xs),
                TextField(
                  style: $styles.text.body,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write about your glum...',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.router.pop(),
        icon: const Icon(Icons.close),
      ),
      title: Text(
        'WED, AUGUST 31 2022',
        style: $styles.text.bodySmall,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }
}
