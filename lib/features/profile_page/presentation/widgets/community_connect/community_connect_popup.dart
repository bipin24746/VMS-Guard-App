import 'package:dayonecontacts/features/profile_page/presentation/bloc/user_profile_bloc.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityConnectPopup extends StatelessWidget {
  final VoidCallback onEnableSuccess;
  final bool isEnabling;

  const CommunityConnectPopup(
      {super.key, required this.onEnableSuccess, required this.isEnabling});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            localization.communityconnect,
            // "Community connect",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
        ),
        Divider(thickness: 1),
        Image.asset("lib/assets/images/communitypic.png"),
        Text(
          localization.connectwithyourcommunity,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        Text(
          isEnabling
              ? localization
                  .turnoncommunityconnectnowtounlockexcitingfeaturesinthefuture
              : localization.areyousureyouwanttodisablecommunityconnect,
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFE0E1E6),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: Wrap(
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(4.0.w),
                        child: Text(
                          localization.ourupcomingfeatures,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(25.r)),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 3.h),
                          child: Text(
                            localization.releasingsoon,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localization.joinvariousgroupsbasedonyourinterests,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      localization.shareyourprofileandconnectwithothers,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      localization
                          .buildmeaningfulrelationshipswithinyourcommunity,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          localization
              .stayconectedwithyourneighboursandcommunitymemberslikeneverbefore,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        Padding(
          padding:  EdgeInsets.all(8.0.w),
          child: Text(
            localization
                .noteyoucanadjustyoursharingpreferencesanytimeinsettings,
            style: TextStyle(fontSize: 12.sp, color: Colors.green),
          ),
        ),
        SizedBox(
          height: 50.h,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              if (isEnabling) {
                BlocProvider.of<UserProfileBloc>(context)
                    .add(FetchCommunityConnect());
              } else {
                BlocProvider.of<UserProfileBloc>(context)
                    .add(FetchCommunityConnect());
              }
            },
            child: Text(
              isEnabling ? localization.enablenow : localization.disablenow,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
