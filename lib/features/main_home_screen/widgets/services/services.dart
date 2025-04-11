import 'package:dayonecontacts/features/main_home_screen/widgets/services/servies_list.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesHome extends StatelessWidget {
  const ServicesHome({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.all(8.0.w),  // Use `.w` for padding
      child: SizedBox(
        height: 300.h,  // Make height responsive
        width: 330.w,   // Make width responsive
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.w), // Make padding responsive
              child: Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.all(8.0.w), // Use `.w` for consistency
                    child: Text(
                      localization.services,
                      style: TextStyle(
                        fontSize: 20.sp,  // Use `.sp` for font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 10.w, // Make spacing responsive
                  mainAxisSpacing: 10.h, // Make spacing responsive
                ),
                itemCount: serviceLists.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final service = serviceLists[index];
                  return Container(
                    width: 50.w,  // Make width responsive
                    height: 100.h, // Make height responsive
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.r), // Make border radius responsive
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(service["icon"], size: 24.sp), // Scale icon size
                        Text(service['serviceName'], style: TextStyle(fontSize: 14.sp)), // Make font size responsive
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
