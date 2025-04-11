import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/profile_page/presentation/bloc/user_profile_bloc.dart';
import 'package:dayonecontacts/features/profile_page/presentation/widgets/community_connect/community_connect_popup.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityConnect extends StatefulWidget {
  const CommunityConnect({super.key});

  @override
  State<CommunityConnect> createState() => _CommunityConnectState();
}

class _CommunityConnectState extends State<CommunityConnect> {
  bool _isToggle = false;
  bool _isEnabled = false;
  bool _isDisabled = false;

  void _showBottomSheet(bool isEnabling) {
    final localization = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,  // Allow content to adjust size dynamically
      isDismissible: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) => sl<UserProfileBloc>(),
            child: BlocListener<UserProfileBloc, UserProfileState>(
              listener: (context, state) {
                if (state is CommunityConnectLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(isEnabling
                          ? localization.itisenabledsuccessfully
                          : localization.itisdisabledsuccessfully),
                      backgroundColor: Colors.green,
                    ),
                  );
                  setState(() {
                    _isEnabled = isEnabling;
                  });
                  AutoRouter.of(context).popForced();
                } else if (state is UserProfileError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${localization.error}: ${state.message}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommunityConnectPopup(
                      onEnableSuccess: () {
                        setState(() {
                          _isEnabled = true;
                        });
                      },
                      isEnabling: isEnabling,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      setState(() {
        _isToggle = _isEnabled;
        _isDisabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserProfileLoaded) {
          final userProfile = state.userProfile;

          if (_isToggle == false) {
            _isToggle = userProfile.isSocialized;
          }

          return SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.orangeAccent.withOpacity(0.1),
                      child: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              localization.communityconnect,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(width: 5),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  localization.releasingsoon,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              localization.getvisibletoyourcommunitymembers,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                  activeColor: Colors.white,
                                  activeTrackColor: Colors.orange,
                                  inactiveTrackColor: Colors.white,
                                  inactiveThumbColor: Colors.orange,
                                  value: _isToggle,
                                  onChanged: _isDisabled
                                      ? null
                                      : (value) {
                                    setState(() {
                                      if (value) {
                                        _isToggle = value;
                                        _isEnabled = false;
                                        _showBottomSheet(true);
                                      } else {
                                        _isDisabled = true;
                                        _showBottomSheet(false);
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
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
