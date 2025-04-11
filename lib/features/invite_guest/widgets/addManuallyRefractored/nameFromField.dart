import 'package:flutter/material.dart';

class NameFormFieldWidgets extends StatelessWidget {
  const NameFormFieldWidgets({super.key,
 required this.controller,
  required  this.hintText,
    this.keyboardType=TextInputType.text,
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15,right: 20,left: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a $hintText';
          }
          return null;
        },
      ),
    );
  }
}


