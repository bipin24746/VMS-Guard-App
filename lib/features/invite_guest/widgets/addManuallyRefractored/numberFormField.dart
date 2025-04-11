import 'package:flutter/material.dart';

class NumberFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final TextInputType keyboardType;
  const NumberFormField({super.key,required this.controller,required this.hinttext,this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:15,right: 20,left: 20,bottom: 20),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: "Mobile Number",
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
