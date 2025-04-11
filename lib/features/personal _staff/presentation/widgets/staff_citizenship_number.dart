import 'package:flutter/material.dart';

class StaffCitizenshipNumber extends StatelessWidget {
  final TextEditingController citizenshipController;
  const StaffCitizenshipNumber({super.key, required this.citizenshipController});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: citizenshipController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Citizenship Number")),
      keyboardType: TextInputType.number,
      ),

    );
  }
}
