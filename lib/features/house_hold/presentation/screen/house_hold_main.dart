import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/features/house_hold/presentation/widgets/house_hold_pet.dart';
import 'package:dayonecontacts/features/house_hold/presentation/widgets/house_hold_vehicle.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HouseHoldMain extends StatelessWidget {
  const HouseHoldMain({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () async {
        AutoRouter.of(context).replace(HomeScreenMainRoute());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            localization.household,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HouseHoldPet(),
              const HouseHoldVehicle(),
            ],
          ),
        ),
      ),
    );
  }
}
