import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../rosary/rosary_screen.dart';
import '../dummy/mission_list_data.dart';

GestureDetector widgetListItem(BuildContext context, int index, Size size) {
  Map<String, double> dataMap = {
    'Color 1': 70.0,
    'Color 2': 30.0,
  };
  List<Color> colorList = [
    const Color.fromARGB(97, 172, 2, 143),
    const Color.fromARGB(255, 243, 125, 194)
  ];
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const RosaryScreen(),
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.r,
            spreadRadius: -2.r,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            // height: 100.h,
            width: size.width * 0.54.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  missionListData[index].title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  missionListData[index].subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  "Target Count: ${missionListData[index].targetCount}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  "Submitted Count: ${missionListData[index].submitCount}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
              width: size.width * 0.31.w,
              child: PieChart(
                dataMap: dataMap,
                colorList: colorList,
                chartRadius: 80.0.r, // Adjust the radius as needed
                chartType:
                    ChartType.disc, // Use ChartType.ring for a ring chart
                chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    chartValueStyle: TextStyle(color: Colors.white)),
                legendOptions: const LegendOptions(
                  // legendPosition: LegendPosition.bottom,
                  showLegends: false,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
    ),
  );
}
