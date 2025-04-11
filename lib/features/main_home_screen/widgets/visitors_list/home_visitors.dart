import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/visitors_list/visitors_list.dart';
import 'package:dayonecontacts/l10n/l10n.dart';

import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  AutoRouter.of(context).push(BlocLoginPageRoute());
}

class HomeVisitors extends StatefulWidget {
  @override
  State<HomeVisitors> createState() => _HomeVisitorsState();
}

class _HomeVisitorsState extends State<HomeVisitors> {
  bool isExpanded = false;

  // Navigate to different pages based on the visitor selection
  void _navigateToPage(BuildContext context, String visitorType) {
    final localization= AppLocalizations.of(context)!;
    switch (visitorType) {
      case "Guest":
      // case "Guest":
        break;
      case "Delivery":
        break;
      case "Ride Sharing":
        AutoRouter.of(context).push(HouseHoldMainRoute());

        break;

      case "Services":
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Container(
      height: isExpanded ? 320.h : null,
      decoration: BoxDecoration(
        color: Color(0xFFeff4ff),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      padding:  EdgeInsets.only(left: 18.0.w, top: 18.h, bottom: 18.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                localization.visitors,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                localization.six,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () => _logout(context), // Fixed onPressed
                child: Row(
                  children: [
                    Text(localization.logout),
                    // Text("View all"),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: SizedBox(
                  height: 95.h,
                  width: 80.w,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.r),
                        topRight: Radius.circular(50.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            isExpanded
                                ? Column(
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Colors.white,
                                        size: 30.sp,
                                      ),
                                      Text(
                                        localization.close,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30.sp,
                                      ),
                                      Text(
                                        localization.addvisitor,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      activeStatus.length,
                      (index) {
                        final people = activeStatus[index];
                        final isOnline = people['status'] == 'online';

                        return Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: Column(
                            children: [
                              Container(
                                width: 70.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        isOnline ? Colors.green : Colors.grey,
                                    width: 3.w,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        width: 70.w,
                                        height: 90.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(people['images']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10.h,
                                      right: 0,
                                      child: Container(
                                        width: 15.w,
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isOnline
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Center(
                                        child: Container(
                                          padding:  EdgeInsets.all(3.w),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Text(
                                            people['shared'],
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                people['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isExpanded)
            Column(
              children: [
                Divider(
                  thickness: 1,
                  color: Colors.red,
                ),
                Row(
                  children: [
                    Text(
                      localization.allowfutureentriesforeasywaytogetinfromthegate,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 11.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Row(
                      children: List.generate(hiddenVisitors.length, (index) {
                        final visibleItem =
                            hiddenVisitors[index]; // Access the map
                        return Padding(
                          padding:
                               EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: GestureDetector(
                            onTap: () {
                              _navigateToPage(context, visibleItem["text"]);
                            },
                            child: Column(
                              children: [
                                Icon(
                                  visibleItem[
                                      "iconVisible"], // Access the icon key
                                  size: 40.sp,
                                ),
                                SizedBox(height: 5.h), // Add spacing
                                Text(
                                  visibleItem["text"], // Access the text key
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }
}
