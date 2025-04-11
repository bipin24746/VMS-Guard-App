import 'package:dayonecontacts/features/profile_page/presentation/user_profile_bloc/user_profile_bloc.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserProfileLoaded) {
          final userProfile = state.userProfile;
          return Container(
            height: 190,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localization.contactinfo
                    ,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 1,
                    color:
                        Colors.grey, // Optional: Make the divider color softer
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orangeAccent.withOpacity(0.1),
                        child: Icon(
                          Icons.mail_outline_outlined,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localization.email,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              userProfile.email,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            localization.change,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Icon(
                            Icons.edit,
                            size: 18,
                          ),
                        ],
                      ),
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
                          Icons.file_copy_outlined,
                          color: Colors.orange,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              localization.mobilenumber
                              ,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              userProfile.contact,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
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
    );
  }
}
