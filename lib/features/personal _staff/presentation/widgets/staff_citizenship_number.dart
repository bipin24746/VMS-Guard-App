import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';

class StaffCitizenshipNumber extends StatelessWidget {
  final TextEditingController citizenshipController;
  const StaffCitizenshipNumber({super.key, required this.citizenshipController});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: citizenshipController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text(localization.citizenshipnumber,)),
      keyboardType: TextInputType.number,
      ),

    );
  }
}
