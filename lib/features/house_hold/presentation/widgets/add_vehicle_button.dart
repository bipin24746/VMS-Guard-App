import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddVehicleButton extends StatelessWidget {

  const AddVehicleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () {

        AutoRouter.of(context).push(
          AddVehiclePageRoute(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100.h,
          width: 95.w,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.lightBlueAccent, Colors.white],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(Icons.add, color: Colors.white, size: 30.sp),
              SizedBox(height: 5.h),
              Text(
                localization.addvehicle
                ,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,  // Adjusted font size
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
