import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/presentation/routes/app_router.gr.dart';
import 'package:glum_mood_tracker/presentation/stats/stats_page.dart';
import 'package:glum_mood_tracker/shared/extensions.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

class MonthPage extends ConsumerStatefulWidget {
  const MonthPage({super.key});

  @override
  ConsumerState<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends ConsumerState<MonthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => context.router.push(const StoryPageRoute()),
              child: StyledCard(
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
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        ref.watch(dateTimeNotifierProvider).value!.dateTimeInMonthYearString,
        style: $styles.text.title2,
      ),
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
