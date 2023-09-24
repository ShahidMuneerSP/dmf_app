import 'dart:math';
import 'package:dmf_app/screens/rosary/controller/rosary_screen_controller.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import '../../../components/theme/app_theme.dart';

class RosaryPainter extends CustomPainter {
  final RosaryScreenController controller;

  RosaryPainter({required this.controller});

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 1.7;
    final double radius = size.width / 1.3;

    const int numberOfSmallBeads = 55;

    const double angleStep = (2 * pi) / numberOfSmallBeads;

    const double smallBeadRadius = 6.0;
    const double bigBeadRadius = 11.0;

    final Paint bigBeadPaint = Paint()
      ..color = AppTheme.shadedPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    for (int i = 0; i < numberOfSmallBeads + 4; i++) {
      final Paint smallBeadPaint = Paint()
        ..color = controller.smallCircleColors[i]
        ..style = PaintingStyle.fill;

      final double angle = (angleStep * i) + pi / 2.85;

      final double x = centerX + radius * cos(angle);
      final double y = centerY + radius * sin(angle);
      final double xx = (size.width / 2) + radius * cos(pi / 2);
      final double yy = (size.height / 2) + 90 + radius * sin(pi / 2);

      if (i == 1 || i == 2 || i == 3) {
        canvas.drawCircle(
          Offset(xx, yy - (i * 15)),
          smallBeadRadius,
          smallBeadPaint,
        );
      } else if (i == 4 ||
          i == 15 ||
          i == 26 ||
          i == 37 ||
          i == 48 ||
          i == 59) {
        canvas.drawCircle(
          Offset(x, y),
          bigBeadRadius,
          bigBeadPaint,
        );
      } else {
        canvas.drawCircle(
          Offset(x, y),
          smallBeadRadius,
          smallBeadPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
