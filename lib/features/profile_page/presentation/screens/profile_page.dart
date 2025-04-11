import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/profile_page/presentation/bloc/user_profile_bloc.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/additional_info.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/community_connect/community_connect.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/contact_info.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/profile_image.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/verify_email.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () async {
        AutoRouter.of(context).replace(HomeScreenMainRoute());
        return false;
      },
      child: BlocProvider(
        create: (context) => sl<UserProfileBloc>()..add(FetchUserProfile()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              localization.profile,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            elevation: 10, // Adds a shadow to the AppBar
            shadowColor: Colors.black.withOpacity(0.5),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18.0.w),
              child: Column(
                children: [
                  VerifyEmail(),
                  SizedBox(height: 10.h),
                  ProfileImage(),
                  SizedBox(height: 10.h),
                  CommunityConnect(),
                  SizedBox(height: 15.h),
                  ContactInfo(), // Uses the shared UserProfileBloc
                  SizedBox(height: 15.h),
                  AdditionalInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
