import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/entity/integration.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlatDetails extends StatelessWidget {
  final Data data;

  const FlatDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final apartment = data.floor?.block?.apartment;

    return Stack(
      children: [
        Container(
          height: 90.h,
          // width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  apartment?.name ?? localization.unknownapartment,
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      apartment?.area ?? localization.unknownarea,
                      style: TextStyle(fontSize: 15.sp),
                    ),
                     SizedBox(width: 10.w),
                    Text(
                      apartment?.city ?? localization.unknowncity,
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: Image.asset(
            'lib/assets/images/flat_buildings.png',
            width: 50,
          ),
        ),
      ],
    );
  }
}
