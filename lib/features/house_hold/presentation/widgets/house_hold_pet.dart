import 'package:dayonecontacts/features/house_hold/presentation/widgets/get_pet_page.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';

class HouseHoldPet extends StatelessWidget {
  const HouseHoldPet({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 10.0, right: 10),
              child: Icon(Icons.pets),
            ),
            Text(
            localization.pets,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        GetPetPage()
      ],
    );
  }
}
