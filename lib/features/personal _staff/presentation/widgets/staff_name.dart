import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PersonalStaffName extends StatelessWidget {
  final TextEditingController staffNameController;

  const PersonalStaffName({super.key, required this.staffNameController});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: staffNameController,
        decoration:  InputDecoration(
          border: OutlineInputBorder(),
          labelText: localization.name,
        ),
      ),
    );
  }
}
