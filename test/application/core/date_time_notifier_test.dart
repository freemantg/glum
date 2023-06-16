import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/shared/providers.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('should update selected date time', () {
    final testDateTime = DateTime(2023, 6, 14);

    container
        .read(dateTimeNotifierProvider.notifier)
        .updateSelectedDateTime(testDateTime);

    expect(
      container.read(dateTimeNotifierProvider),
      equals(AsyncData(testDateTime)),
      reason: 'state should be updated with new dateTime',
    );
  });
}
