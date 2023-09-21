import 'package:dmf_app/screens/Splash/splash_screen.dart';
import 'package:dmf_app/screens/rosary/rosary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Gordita",
        ),
        home: child,
      ),
      child: const SplashScreen(),
    );
  }
}
