import 'package:dayonecontacts/features/profile_page/presentation/user_profile_bloc/user_profile_bloc.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Divider(thickness: 1),
        Image.asset("lib/assets/images/communitypic.png"),
        Text(
          localization.connectwithyourcommunity,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          localization.ourupcomingfeatures,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: Text(
                            localization.releasingsoon,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          localization
              .stayconectedwithyourneighboursandcommunitymemberslikeneverbefore,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            localization
                .noteyoucanadjustyoursharingpreferencesanytimeinsettings,
            style: TextStyle(fontSize: 12, color: Colors.green),
          ),
        ),
        SizedBox(
          height: 50,
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
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
