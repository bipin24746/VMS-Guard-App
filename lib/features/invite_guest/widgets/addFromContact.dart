import 'package:dayonecontacts/features/invite_guest/widgets/addfromContacts/addContactDetails.dart';

import 'package:flutter/material.dart';

class AddFromContact extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) selectedContacts;
  const AddFromContact({super.key, required this.selectedContacts});

  @override
  State<AddFromContact> createState() => _AddFromContactState();
}

class _AddFromContactState extends State<AddFromContact> {
  bool? value = false;
  List<int> multipleSelected = [];
  final List<Map<String, dynamic>> contacts = [
    {
      "letter": "A",
      "name": "Aayushman Singh",
      "phone": "9861158315",
    },
    {"letter": "A", "name": "Aayush ", "phone": "9843700444"},
    {"letter": "A", "name": "Suraj Shrestha", "phone": "9861845236"},
    {"letter": "#", "name": "*3243*", "phone": "*3243*"},
    {"letter": "9", "name": "9861158315", "phone": "9861158315"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final isSelects = multipleSelected.contains(index);
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(contact["letter"]),
            ),
            title: AddContactDetails(
              contactLetter: contact["letter"],
              contactName: contact["name"],
              contactPhone: contact["phone"],
            ),
            trailing: Checkbox(
              checkColor: isSelects ? Colors.black : null,
              value: isSelects,
              onChanged: (bool? newValue) {
                // onChanged: (bool? value) {
                setState(() {
                  if (newValue == true) {
                    // Add the index to the selected list
                    multipleSelected.add(index);
                  } else {
                    // Remove the index from the selected list
                    multipleSelected.remove(index);
                  }
                  // Pass the selected contacts list to the parent or another method
                  widget.selectedContacts(
                    multipleSelected.map((i) => contacts[i]).toList(),
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }
}
