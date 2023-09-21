import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dmf_app/components/theme/app_theme.dart';
import 'package:dmf_app/screens/rosary/widgets/app_bar_widget.dart';
import 'package:dmf_app/screens/rosary/widgets/button_widget.dart';
import 'package:dmf_app/screens/rosary/widgets/dot_widget.dart';
import 'package:dmf_app/screens/rosary/widgets/rosary_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'controller/rosary_screen_controller.dart';

class RosaryScreen extends StatefulWidget {
  const RosaryScreen({super.key});

  @override
  State<RosaryScreen> createState() => _RosaryScreenState();
}

class _RosaryScreenState extends State<RosaryScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RosaryScreenController>();
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple.withOpacity(0.5),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppBarWidget(title: 'Pray for manipur'),
              Container(
                width: size.width / 1.39.w, // Adjust the size as needed
                height: size.height / 2.3.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: CustomPaint(
                    painter: RosaryPainter(controller: controller),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Consumer(
                          builder: (context, value, child) => Column(
                            children: [
                              Text(
                                'Rosary: ${controller.defaultCount}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Text(
                                "Count: ${controller.currentCount}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              ButtonWidget(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext ctx) {
                                          return AlertDialog(
                                            content: const Text(
                                                'Do you want to reset?'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    controller.editCount();
                                                    controller
                                                            .smallCircleColors =
                                                        List.filled(53,
                                                            Colors.white);
                                                    controller.bigCircleColors =
                                                        List.filled(5,
                                                            Colors.transparent);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        color: AppTheme
                                                            .splashColor),
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: AppTheme
                                                            .splashColor),
                                                  ))
                                            ],
                                          );
                                        });
                                  },
                                  title: 'Reset Count')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // const DotSmall(),
              // SizedBox(
              //   height: 2.h,
              // ),
              // const DotSmall(),
              // SizedBox(
              //   height: 2.h,
              // ),
              // const DotSmall(),
              // SizedBox(
              //   height: 2.h,
              // ),
              // const DotBig(),
              // SizedBox(
              //   height: 2.h,
              // ),
              // SvgPicture.asset(
              //   'assets/christ_on_the_cross.svg',
              //   height: 45.0.h,
              //   width: 60.0.w,
              //   color: Colors.white,
              // ),
              // SizedBox(
              //   height: 50.h,
              // ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20.w),
              //   width: ScreenUtil()
              //       .setWidth(size.width), // Adjust the desired width
              //   child: SingleChildScrollView(
              //     physics: const BouncingScrollPhysics(),
              //     child: Center(
              //       // ignore: deprecated_member_use
              //       child: TypewriterAnimatedTextKit(
              //         text: const [
              //           'Our Father',
              //           'Our Father,who art in heaven hallowed be thy name; thy kingdom come; thy will be done on earth as it is in heaven. Give us this day our daily bread and forgive us our trespasses as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil. Amen.'
              //         ],
              //         textStyle: TextStyle(
              //           color: Colors.white,
              //           fontSize: 16.sp,
              //           fontWeight: FontWeight.bold,
              //         ),
              //         speed: const Duration(milliseconds: 300),
              //         totalRepeatCount: 1,
              //         isRepeatingAnimation: false,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        floatingActionButton: Row(
          children: [
            SizedBox(
              width: 25.w,
            ),
            const Spacer(),
            FloatingActionButton(
              heroTag: 'Back',
              backgroundColor: Colors.white,
              onPressed: () {
                controller.decrementCount();
              },
              child: Icon(
                Icons.remove,
                color: AppTheme.splashColor,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 20.w,
            ),
            ButtonWidget(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        content: const Text('Do you want to submit?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(color: AppTheme.splashColor),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'No',
                                style: TextStyle(color: AppTheme.splashColor),
                              ))
                        ],
                      );
                    });
              },
              title: 'Submit',
            ),
            const Spacer(),
            SizedBox(
              width: 20.w,
            ),
            FloatingActionButton(
              heroTag: 'Add',
              onPressed: () {
                controller.incrementCount();
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.add,
                color: AppTheme.splashColor,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
