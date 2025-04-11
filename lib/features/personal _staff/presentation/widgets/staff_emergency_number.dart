import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffEmergencyNumber extends StatelessWidget {
  final TextEditingController emergencyNumberController;
  const StaffEmergencyNumber({super.key, required this.emergencyNumberController});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return SizedBox(
      height: 45.h,
      child: TextFormField(
        controller: emergencyNumberController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text(localization.emergencynumber)),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
