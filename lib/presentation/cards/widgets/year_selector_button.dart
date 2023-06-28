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
    final selectedDateTime = ref.watch(dateTimeNotifierProvider).value;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            ref
                .read(dateTimeNotifierProvider.notifier)
                .updateSelectedDateTime(DateTime(selectedDateTime!.year - 1));
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        Text(
          ref.watch(dateTimeNotifierProvider).maybeMap(
                data: (selectedDate) => selectedDate.value.year.toString(),
                orElse: () => 'Error loading selected year',
              ),
          style: $styles.text.h3,
        ),
        IconButton(
          onPressed: () {
            ref
                .read(dateTimeNotifierProvider.notifier)
                .updateSelectedDateTime(DateTime(selectedDateTime!.year + 1));
          },
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }
}
