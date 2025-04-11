import 'package:flutter/material.dart';

class StaffEmergencyNumber extends StatelessWidget {
  final TextEditingController emergencyNumberController;
  const StaffEmergencyNumber({super.key, required this.emergencyNumberController});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: emergencyNumberController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Emergency Number")),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
