import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonHomeNavBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonHomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return AppBar(
      automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(
              Icons.home,
              size: 20.sp,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8.0.w),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localization.citiplexcolony,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    localization.blockflat,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Icon(Icons.arrow_downward),
            Spacer(),
            Padding(
              padding:  EdgeInsets.all(8.0.w),
              child: Icon(Icons.notifications_none_outlined),
            ),
            GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(ProfilePageRoute());
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('lib/assets/images/Photu.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
            )
          ],
        ),
      elevation: 10, // This adds a shadow to the AppBar
      shadowColor: Colors.black.withOpacity(0.5),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
