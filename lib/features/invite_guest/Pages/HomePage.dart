import 'package:dayonecontacts/common/widgets/common_app_bar.dart';
import 'package:dayonecontacts/features/invite_guest/Pages/addManually.dart';
import 'package:dayonecontacts/features/invite_guest/Pages/inviteGuest.dart';
import 'package:dayonecontacts/features/invite_guest/widgets/addFromContact.dart';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> selectedGuests = [];
  List<Map<String, dynamic>> selected = [];

  void updateSelectedGuests(List<Map<String, dynamic>> guests) {
    setState(() {
      selectedGuests = guests;
    });
  }

  void updateSelectedContacts(List<Map<String, dynamic>> contacts) {
    setState(() {
      selected = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: CommonAppBar(),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: AddManually(
                        selectContacts: updateSelectedContacts,
                      ),
                    ),
                    Center(
                      child: AddFromContact(
                        selectedContacts: updateSelectedGuests,
                      ),
                    ),
                  ],
                ),
              ),
              InviteGuest(
                selectedContacts: selectedGuests,
                selectContacts: selected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
