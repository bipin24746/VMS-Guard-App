import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlatInfoContainer extends StatelessWidget {
  final String icon;
  final String label;

  const FlatInfoContainer({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 120.w,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 40.sp),
          Text(label),
        ],
      ),
    );
  }
}
