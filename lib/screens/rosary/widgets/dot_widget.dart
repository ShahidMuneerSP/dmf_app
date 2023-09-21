import 'package:dmf_app/components/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotSmall extends StatelessWidget {
  const DotSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14.w, // Adjust the size of the dot as needed
      height: 11.h,
      decoration: const BoxDecoration(
        color: Colors.white, // Adjust the color as needed
        shape: BoxShape.circle,
      ),
    );
  }
}

class DotBig extends StatelessWidget {
  const DotBig({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23.w, // Adjust the size of the dot as needed
      height: 23.h,
      decoration: BoxDecoration(
        border: Border.all(
            width: 2.w,
            color: AppTheme.shadedPrimaryColor), // Adjust the color as needed
        shape: BoxShape.circle,
      ),
    );
  }
}
