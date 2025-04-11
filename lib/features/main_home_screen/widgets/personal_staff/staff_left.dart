import 'package:flutter/material.dart';

class PersonalStaffLeft extends StatelessWidget {
  const PersonalStaffLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Center(
        child: Text(
          "Data",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
