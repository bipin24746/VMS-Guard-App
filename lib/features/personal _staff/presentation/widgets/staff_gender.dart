import 'package:flutter/material.dart';

class GenderDropdown extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String?> onChanged;
  final List<String> genderList;

  const GenderDropdown({
    super.key,
    required this.selectedGender,
    required this.onChanged,
    required this.genderList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
          value: selectedGender,
          hint: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Select Gender",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          isExpanded: true,
          items: genderList.map<DropdownMenuItem<String>>(
                (String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(gender),
                ),
              );
            },
          ).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
