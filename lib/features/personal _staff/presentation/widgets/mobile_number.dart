import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';

class StaffMobileNumber extends StatelessWidget {
  final TextEditingController mobileNumberController;
  const StaffMobileNumber({super.key, required this.mobileNumberController});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: mobileNumberController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(
            localization.mobilenumber,
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
