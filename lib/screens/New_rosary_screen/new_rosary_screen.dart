import 'package:dmf_app/components/theme/app_theme.dart';
import 'package:dmf_app/screens/New_rosary_screen/widgets/widgetListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dummy/mission_list_data.dart';

class NewRosaryScreen extends StatelessWidget {
  const NewRosaryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.5),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  'Missions',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: missionListData.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      widgetListItem(context, index,size)),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
