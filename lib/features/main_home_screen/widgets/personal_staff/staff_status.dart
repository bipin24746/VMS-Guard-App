import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';

class StaffStatus extends StatefulWidget {
  const StaffStatus({super.key});

  @override
  State<StaffStatus> createState() => _StaffStatusState();
}

class _StaffStatusState extends State<StaffStatus> {
  int selectedIndex = 0; // Keeps track of the selected button

  void colorChange(int index) {
    setState(() {
      selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildButton(
          text: localization.inside,
          isSelected: selectedIndex == 0,
          onTap: () => colorChange(0),
        ),
        _buildButton(
          text: localization.left,
          isSelected: selectedIndex == 1,
          onTap: () => colorChange(1),
        ),
        _buildButton(
          text: localization.notarrived,
          isSelected: selectedIndex == 2,
          onTap: () => colorChange(2),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        border: isSelected ? Border.all(color: Colors.green) : null,
        color: isSelected ? Colors.green.withOpacity(0.1) : null,
        borderRadius: isSelected ? BorderRadius.circular(50) : null,
      ),
      child: TextButton(
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.green : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
