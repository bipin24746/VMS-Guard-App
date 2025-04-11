import 'package:flutter/material.dart';

class DateOfBirth extends StatelessWidget {
  final TextEditingController dobController;
  const DateOfBirth({super.key, required this.dobController});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: dobController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Date of Birth")),
      ),
    );
  }
}
