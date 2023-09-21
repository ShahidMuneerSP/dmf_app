import 'dart:math';
import 'package:dmf_app/screens/rosary/controller/rosary_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import '../../../components/theme/app_theme.dart';

class RosaryPainter extends CustomPainter {
  final RosaryScreenController controller;

  RosaryPainter({required this.controller});

  @override
  void paint(Canvas canvas, Size size) {
    ///
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 1.3;
    final Paint rosaryPaint = Paint()
      ..color = Colors.transparent // Adjust the color as needed
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    final Paint smallBottomPaint = Paint()
      ..color = Color.fromARGB(255, 255, 255, 255) // Adjust the color as needed
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    final startPoint = Offset(centerX, centerX);
    final endPoint = Offset(centerX, centerX + 100);

    ///

    // Draw the main circle
    // canvas.drawCircle(Offset(centerX, centerY), radius, rosaryPaint);
    // canvas.drawLine(startPoint, endPoint, rosaryPaint);

    // Draw the beads along the circumference
    ///
    const int numberOfSmallBeads = 50; // Total number of small circles
    const int beadsPerBigCircle =
        11; // Number of small circles before a big circle
    const double angleStep = (2 * pi) / numberOfSmallBeads;
    const double smallBeadRadius = 6.0; // Adjust the small bead size as needed
    const double bigBeadRadius = 11.0; // Adjust the big circle size as needed
    final Paint bigBeadPaint = Paint()
      ..color = AppTheme.shadedPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    for (int i = 0; i < numberOfSmallBeads + 4; i++) {
      final Paint smallBeadPaint = Paint()
        ..color = controller
            .smallCircleColors[i] // Adjust the small bead color as needed
        ..style = PaintingStyle.fill;

      final double angle = (angleStep * i) + pi / 2.95; // Adjust starting angle
      final double x = centerX + radius * cos(angle);
      final double y = centerY + radius * sin(angle);
      final double xx = (size.width / 2) + radius * cos(pi / 2);
      final double yy = (size.height / 2) + 100 + radius * sin(pi / 2);

      ///
      // final countlimit=0;

      // if (i == 1 || i == 2 || i == 3) {
      //   canvas.drawCircle(
      //       Offset(xx, yy - (i * 25)), smallBeadRadius, smallBeadPaint);
      // } else {
      //   if (i % beadsPerBigCircle == 0) {
      //     // Adjust starting angle

      //     // if ((i ~/ beadsPerBigCircle) == controller.currentBigCircleIndex) {
      //     //   bigBeadPaint.color = controller
      //     //       .changeBigCircleColors[controller.currentBigCircleIndex];
      //     // } else {
      //     //   bigBeadPaint.color = AppTheme.shadedPrimaryColor;
      //     // }

      //     // Draw big circle after every 10 small circles
      //     canvas.drawCircle(Offset(x, y), bigBeadRadius, bigBeadPaint);
      //     // canvas.drawLine(startPoint, endPoint, rosaryPaint);
      //   } else {
      //     // Draw a small filled circle
      //     // if(i==1||i==2||i==3){
      //     // canvas.drawCircle(Offset(xx, yy+(i*25)), smallBeadRadius, smallBeadPaint);
      //     // }

      //         canvas.drawCircle(Offset(x, y), smallBeadRadius, smallBeadPaint);

      //   }

      ///
      if (i == 1 || i == 2 || i == 3) {
        canvas.drawCircle(
            Offset(xx, yy - (i * 25)), smallBeadRadius, smallBeadPaint);
      } else {
        // if (i % beadsPerBigCircle == 0) {
        // // Adjust starting angle

        // if ((i ~/ beadsPerBigCircle) == controller.currentBigCircleIndex) {
        //   bigBeadPaint.color = controller
        //       .changeBigCircleColors[controller.currentBigCircleIndex];
        // } else {
        //   bigBeadPaint.color = AppTheme.shadedPrimaryColor;
        // }

        // Draw big circle after every 10 small circles
        // canvas.drawCircle(Offset(x, y), bigBeadRadius, bigBeadPaint);
        // i--;
        // canvas.drawLine(startPoint, endPoint, rosaryPaint);
        // }
        //  else {
        canvas.drawCircle(Offset(x, y), smallBeadRadius, smallBeadPaint);
        // }
        // if(i%11==0){
        //   i++;
        // }
      }

      ///

      // }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
