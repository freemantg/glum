import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../styles/styles.dart';

class YearSelectorButton extends ConsumerWidget {
  const YearSelectorButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showPickYearDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => const StyledYearPickerAlertDialog(),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () => showPickYearDialog(context),
          child: Text(
            ref.watch(dateTimeNotifierProvider).maybeMap(
                  data: (selectedDate) => selectedDate.value.year.toString(),
                  orElse: () => 'Error loading selected year',
                ),
            style: $styles.text.h3,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(width: 82.0),
            Icon(Icons.keyboard_arrow_down),
          ],
        )
      ],
    );
  }
}

class StyledYearPickerAlertDialog extends ConsumerWidget {
  const StyledYearPickerAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final currentYear = DateTime.now().year;

    return AlertDialog(
      title: const Text('Select a Year'),
      contentPadding: const EdgeInsets.all(10),
      content: SizedBox(
        height: size.height / 3,
        width: size.width,
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            ...List.generate(
              currentYear - 2000,
              (index) => InkWell(
                onTap: () {
                  ref
                      .read(dateTimeNotifierProvider.notifier)
                      .updateSelectedDateTime(DateTime(currentYear - index));
                  context.popRoute();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    label: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text((currentYear - index).toString()),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
