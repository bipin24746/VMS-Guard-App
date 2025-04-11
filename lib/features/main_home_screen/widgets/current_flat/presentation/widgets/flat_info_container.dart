import 'package:flutter/material.dart';

class FlatInfoContainer extends StatelessWidget {
  final String icon;
  final String label;

  const FlatInfoContainer({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 40),
          Text(label),
        ],
      ),
    );
  }
}
