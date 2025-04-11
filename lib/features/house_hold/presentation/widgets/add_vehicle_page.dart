import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/vehicle_bloc/vehicle_bloc.dart';
import 'package:dayonecontacts/features/house_hold/presentation/screen/vehicle_form.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
        create: (context) => sl<VehicleBloc>(),
        child: BlocListener<VehicleBloc, VehicleState>(
          listener: (context, state) {
            if (state is VehicleSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text(localization.vehiclesaddedsuccessfully),
                  backgroundColor: Colors.green,
                ),
              );
              AutoRouter.of(context).push(HouseHoldMainRoute());
            } else if (state is VehicleFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${localization.error}: ${state.error}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: VehicleForm(),
        ));
  }
}
