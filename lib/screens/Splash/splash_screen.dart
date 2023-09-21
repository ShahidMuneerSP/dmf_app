import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../components/theme/app_theme.dart';
import '../New_rosary_screen/new_rosary_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogined = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const NewRosaryScreen()),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "DMF",
            style: TextStyle(
              fontSize: 35.sp,
              color: AppTheme.splashColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          SpinKitFadingCircle(
            color: AppTheme.primaryColor,
            size: 40.r,
          ),
        ],
      ),
    );
  }
}
