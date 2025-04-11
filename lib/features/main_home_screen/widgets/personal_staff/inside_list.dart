import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';

class InsideListStaff extends StatelessWidget {
  const InsideListStaff({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      body: Text(localization.data),
    );
  }
}
