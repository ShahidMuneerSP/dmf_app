import 'package:dmf_app/screens/rosary/widgets/rosary_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controller/rosary_screen_controller.dart';

class WidgetTest extends StatefulWidget {
  const WidgetTest({super.key});

  @override
  State<WidgetTest> createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RosaryScreenController>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Container(
            width: size.width / 1.50.w, // Adjust the size as needed
                height: size.height / 2.3.h,
          child: CustomPaint(
            painter: RosaryPainter(controller: controller),
        
          ),
        ),
      ),
    );
  }
}
