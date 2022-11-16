import 'package:flutter/material.dart';
import 'package:glum_mood_tracker/presentation/stats/stats_page.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

class MonthPage extends StatelessWidget {
  const MonthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return StyledCard(
              customPadding: true,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all($styles.insets.lg),
                    child: Column(
                      children: [
                        Text('14', style: $styles.text.h3),
                        Text('Mon',
                            style: $styles.text.h4.copyWith(
                              fontWeight: FontWeight.normal,
                              height: 0,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Column(
                        children: const [
                          Placeholder(
                            fallbackHeight: 148.0,
                            strokeWidth: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('NOVEMBER 2022', style: $styles.text.title2),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
        ),
      ],
    );
  }
}
