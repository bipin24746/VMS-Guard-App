import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Text(
      localization.yourapartment,
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
    );
  }
}
