import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/profile_page/presentation/user_profile_bloc/user_profile_bloc.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/additional_info.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/community_connect/community_connect.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/contact_info.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/profile_image.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/verify_email.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () async{
        AutoRouter.of(context).replace(HomeScreenMainRoute());
        return false;
      },
      child: BlocProvider(
        create: (context) => sl<UserProfileBloc>()..add(FetchUserProfile()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title:  Text(
              localization.profile,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            elevation: 10, // Adds a shadow to the AppBar
            shadowColor: Colors.black.withOpacity(0.5),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: const [
                  VerifyEmail(),
                  SizedBox(height: 10),
                  ProfileImage(),
                  SizedBox(height: 10),
                  CommunityConnect(),
                  SizedBox(height: 15),
                  ContactInfo(), // Uses the shared UserProfileBloc
                  SizedBox(height: 15),
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
