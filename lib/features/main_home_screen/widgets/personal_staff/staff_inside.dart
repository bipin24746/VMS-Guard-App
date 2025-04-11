import 'package:dayonecontacts/features/main_home_screen/widgets/personal_staff/inside_staff_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffInside extends StatelessWidget {
  const StaffInside({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h, // Responsive height
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: InsideStaffList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final peoples = InsideStaffList[index];

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures spacing
                    children: [
                      // Profile Image
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.green,
                            width: 2.w,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2.w),
                              child: SizedBox(
                                height: 60.h,
                                width: 60.w,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2.w,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(peoples["images"]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10.h,
                              right: 2.w,
                              child: Container(
                                width: 10.w,
                                height: 10.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Name & Position
                      Expanded( // Prevents overflow
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                peoples["name"],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: 100.w,
                                height: 25.h,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      peoples["position"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Call Icon
                      Column(
                        children: [
                          Icon(Icons.call, size: 20.sp),
                          Text(
                            "Call",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
