import 'package:dayonecontacts/common/widgets/common_avatar_widget.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String numbers;
  final bool isSelected;
  final VoidCallback onToggleSelection;
  const ContactCard({super.key, required this.name, required this.numbers, required this.isSelected, required this.onToggleSelection,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.orange.withOpacity(0.1)
                    : Colors.white,
                border: Border.all(
                  color:
                  isSelected ? Colors.orange : Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCircleAvatar(isSelected: isSelected, name: name,),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        name,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.orange
                              : Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      numbers,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.orange
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -8,
              right: -8,
              child: Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: isSelected,
                  onChanged: (_) => onToggleSelection(),
                  activeColor: Colors.orange,
                  shape: const CircleBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
