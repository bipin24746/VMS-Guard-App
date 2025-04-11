import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/features/profile_page/presentation/user_profile_bloc/user_profile_bloc.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserProfileLoaded) {
          final userProfile = state.userProfile;

          return Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: userProfile.image.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(userProfile.image),
                          fit: BoxFit.fill,
                        )
                      : null,
                ),
                child: userProfile.image.isEmpty
                    ? const Center(
                        child: Icon(
                          Icons.person_2_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                      )
                    : null,
              ),
              Text(
                userProfile.name,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: Text(
                    userProfile.type,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
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
