import 'package:flutter/material.dart';

class PersonalStaffName extends StatelessWidget {
  final TextEditingController staffNameController;

  const PersonalStaffName({super.key, required this.staffNameController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: staffNameController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Name",
        ),
      ),
    );
  }
}
