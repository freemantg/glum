import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glum_mood_tracker/styles/styles.dart';

import '../../../styles/colors.dart';

class DoughnutChart extends StatelessWidget {
  final List<int> data;
  final double width;
  final double height;

  const DoughnutChart({
    Key? key,
    required this.data,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: DoughnutChartPainter(context, data),
    );
  }
}

class DoughnutChartPainter extends CustomPainter {
  final BuildContext context;
  final List<int> data;

  DoughnutChartPainter(this.context, this.data);

  final colorList = colors;

  @override
  void paint(Canvas canvas, Size size) {
    int total = data.reduce((value, element) => value + element);
    double currentAngle = pi * 2;

    for (int i = 0; i < data.length; i++) {
      double sweepAngle = (data[i] / total) * pi;
      final path = Path()
        ..moveTo(size.width / 2, size.height / 2)
        ..arcTo(
          Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2 * 0.8,
          ),
          currentAngle,
          -sweepAngle,
          false,
        )
        ..close();
      final paint = Paint()..color = colors[i + 1];
      canvas.drawPath(path, paint);
      currentAngle -= sweepAngle;
    }

    final centerCirclePaint = Paint()..color = $styles.cardColor;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2 * 0.6,
      centerCirclePaint,
    );
  }

  @override
  bool shouldRepaint(DoughnutChartPainter oldDelegate) {
    return data != oldDelegate.data || colors != oldDelegate.colorList;
  }
}
