import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalStaffLeft extends StatelessWidget {
  const PersonalStaffLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: Center(
        child: Text(
          "Data",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
