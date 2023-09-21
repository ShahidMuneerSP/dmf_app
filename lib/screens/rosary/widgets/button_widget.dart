import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/theme/app_theme.dart';


class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const ButtonWidget({super.key,required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: AppTheme.splashColor, fontSize: 12.sp),
        ));
  }
}