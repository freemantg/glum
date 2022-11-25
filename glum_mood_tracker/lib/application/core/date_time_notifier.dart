import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTimeNotifier extends StateNotifier<AsyncValue<DateTime>> {
  DateTimeNotifier() : super(AsyncData(DateTime.now()));

  void updateSelectedDateTime(DateTime dateTime) => state = AsyncData(dateTime);
}
