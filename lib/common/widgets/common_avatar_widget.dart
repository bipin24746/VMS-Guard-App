
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.isSelected,
    required this.name,
  });

  final bool isSelected;
  final String name;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: isSelected
          ? Colors.white
          : Colors.grey,
      child: Text(
        name[0],
        style: TextStyle(
          color: isSelected
              ? Colors.orange
              : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
