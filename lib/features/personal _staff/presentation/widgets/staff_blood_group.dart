import 'dart:developer';
import 'package:dayonecontacts/features/personal%20_staff/presentation/screens/account_create_form.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodGroupDropdown extends StatelessWidget {
  final String? selectedBloodGroup;
  final ValueChanged<String?> onChanged;
  final List<BloodGroupEntity> bloodGroupList;

  const BloodGroupDropdown({
    super.key,
    required this.selectedBloodGroup,
    required this.onChanged,
    required this.bloodGroupList,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return SizedBox(
      height: 45.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: DropdownButton<String>(
          value: selectedBloodGroup,
          hint: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Text(
              localization.bloodgroup,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ),
          isExpanded: true,
          items: bloodGroupList.map<DropdownMenuItem<String>>(
                (BloodGroupEntity bloodGroup) {
              return DropdownMenuItem<String>(
                value: bloodGroup.value,
                child: Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: Text(bloodGroup.name),
                ),
              );
            },
          ).toList(),
          onChanged: (String? newValue) {
            log('Blood Group: $newValue');
            onChanged(newValue);
          },
        ),
      ),
    );
  }
}
