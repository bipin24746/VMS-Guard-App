import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateOfBirth extends StatelessWidget {
  final TextEditingController dobController;
  const DateOfBirth({super.key, required this.dobController});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return SizedBox(
      height: 45.h,
      child: TextFormField(
        controller: dobController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text(localization.dateofbirth)),
      ),
    );
  }
}
