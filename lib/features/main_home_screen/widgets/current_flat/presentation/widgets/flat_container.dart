import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/entity/integration.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/presentation/widgets/flat_details.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/presentation/widgets/flat_info_row.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/presentation/widgets/title_widget.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlatContainer extends StatelessWidget {
  final CurrentFlatIntegration currentFlatIntegration;

  const FlatContainer({required this.currentFlatIntegration});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final data = currentFlatIntegration.data;

    if (data == null) {
      // debugPrint("No flat found!");
      return Center(child: Text(localization.noflatavailable));
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Container(
        height: 200.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white30,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWidget(), // Displays the title "Your apartment"
              Divider(thickness: 2, color: Colors.blueGrey, height: 10.h),
              FlatDetails(
                  data: data), // Displays detailed information about the flat
              SizedBox(height: 10.h),
              FlatInfoRow(data: data), // Displays additional flat info in a row
            ],
          ),
        ),
      ),
    );
  }
}
