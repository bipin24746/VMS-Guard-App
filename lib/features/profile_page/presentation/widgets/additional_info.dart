import 'package:dayonecontacts/features/profile_page/presentation/bloc/user_profile_bloc.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key});

  // Function to format the Date of Birth
  // String _formatDateOfBirth(String dob) {
  //   if (dob.isNotEmpty) {
  //     try {
  //       // Parse the ISO 8601 date and format it
  //       DateTime date = DateTime.parse(dob);
  //       return DateFormat('MMM dd yyyy').format(date); // Format: Mar 04 2025
  //     } catch (e) {
  //       return "-"; // If parsing fails, return a placeholder
  //     }
  //   }
  //   return "-"; // Return placeholder if dob is empty
  // }

  // Function to convert full blood group name to shorthand
  String _getBloodGroupShorthand(String bloodGroupFull) {
    // Map full value to shorthand
    final bloodGroupMap = {
      "o_positive": "O+",  // o_positive -> O+
      "o_negative": "O-",  // o_negative -> O-
      "a_positive": "A+",  // a_positive -> A+
      "a_negative": "A-",  // a_negative -> A-
      "b_positive": "B+",  // b_positive -> B+
      "b_negative": "B-",  // b_negative -> B-
      "ab_positive": "AB+", // ab_positive -> AB+
      "ab_negative": "AB-", // ab_negative -> AB-
    };

    return bloodGroupMap[bloodGroupFull] ?? "-"; // If no mapping found, return a placeholder
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    String _formatDateOfBirth(String dob) {

        if (dob.isNotEmpty) {
          try {
            // Parse the ISO 8601 date and format it
            DateTime date = DateTime.parse(dob);
            return DateFormat(localization.mmddyyyy).format(date); // Format: Mar 04 2025
          } catch (e) {
            return "-"; // If parsing fails, return a placeholder
          }
        }
        return "-"; // Return placeholder if dob is empty
      }
    return BlocProvider(
      create: (context) => sl<UserProfileBloc>()..add(FetchUserProfile()),
      child: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserProfileLoaded) {
            final userProfile = state.userProfile;

            return SizedBox(

              child: DecoratedBox(decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(20)),child: Padding(
                padding:  EdgeInsets.all(8.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          localization.additionalinfo
                          ,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            AutoRouter.of(context)
                                .push(EditAdditionalInfoRoute(userProfileEntity: userProfile));
                          },
                          child: Row(
                            children: [Text(localization.edit), Icon(Icons.edit)],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orangeAccent.withOpacity(0.1),
                          child: Icon(
                            Icons.person_2_outlined,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(
                            width: 10.w), // Space between the avatar and content
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.15.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                localization.name,
                                style: TextStyle(
                                    fontSize: 15.sp, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                userProfile.name.isNotEmpty
                                    ? userProfile.name
                                    .split(' ') // Split the name by spaces
                                    .map((name) =>
                                name.isNotEmpty ? name[0].toUpperCase() + name.substring(1) : '')
                                    .join(' ') // Join the words back with spaces
                                    : "-", // Placeholder text
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    // Gender Row
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orangeAccent.withOpacity(0.1),
                          child: Icon(
                            Icons.male,
                            color: Colors.orange,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                localization.gender,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                userProfile.gender.isNotEmpty
                                    ? userProfile.gender[0].toUpperCase() + userProfile.gender.substring(1)
                                    : "-", // Placeholder text
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orangeAccent.withOpacity(0.1),
                          child: Icon(
                            Icons.bloodtype_outlined,
                            color: Colors.orange,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                localization.bloodgroup,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _getBloodGroupShorthand(userProfile.bloodgroup), // Display shorthand
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    // Date of Birth Row
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orangeAccent.withOpacity(0.1),
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.orange,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                localization.dateofbirth,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _formatDateOfBirth(userProfile.dob), // Use formatted date here
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),)
            );
          } else if (state is UserProfileError) {
            return Text(
              '${localization.error}: ${state.message}',
              style: const TextStyle(color: Colors.red),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
