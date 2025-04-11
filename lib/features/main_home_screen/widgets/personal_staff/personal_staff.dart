import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/personal_staff/staf_not_arrived.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/personal_staff/staff_inside.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/personal_staff/staff_left.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalStaffHome extends StatelessWidget {
  const PersonalStaffHome({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Padding(
        padding: EdgeInsets.all(8.0.w), // Responsive padding
        child: Container(
          height: 300.h, // Responsive height
          width: 1.sw, // Full screen width
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(30.r), // Responsive border radius
          ),
          child: Padding(
            padding: EdgeInsets.all(18.0.w), // Responsive padding
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          localization.personalstaff,
                          style: TextStyle(
                            fontSize: Localizations.localeOf(context).languageCode == 'en' ? 20.sp : 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          localization.four,
                          style: TextStyle(
                            fontSize: Localizations.localeOf(context).languageCode == 'en' ? 20.sp : 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(PersonalStaffStatusRoute());
                      },
                      child: Row(
                        children: [
                          Text(
                            localization.viewall,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0.w),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.arrow_right, size: 24.sp), // Scaled icon size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h), // Responsive spacing
                Center(
                  child: Container(
                    height: 50.h, // Responsive height
                    width: 1.sw, // Full screen width
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: ClipRRect(
                      child: TabBar(
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        indicatorPadding: EdgeInsets.symmetric(vertical: 12.h), // Adjusted indicator padding
                        tabs: [
                          Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: Tab(text: localization.inside),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: Tab(text: localization.left),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: Tab(text: localization.notarrived),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h), // Responsive spacing
                Expanded(
                  child: TabBarView(
                    children: [
                      StaffInside(),
                      PersonalStaffLeft(),
                      StaffNotArrived(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
