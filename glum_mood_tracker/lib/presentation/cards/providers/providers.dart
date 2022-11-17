import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final pageViewControllerProvider = Provider((ref) => PageController(
      viewportFraction: 0.8,
      initialPage: DateTime.now().month - 1,
    ));


