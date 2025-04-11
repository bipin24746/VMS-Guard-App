import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/vehicle_entity.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/vehicle_bloc/vehicle_bloc.dart';
import 'package:dayonecontacts/features/house_hold/presentation/screen/edit_vehicle_form.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditVehiclePage extends StatefulWidget {
  final VehicleEntity vehicle;
  const EditVehiclePage({super.key, required this.vehicle});

  @override
  State<EditVehiclePage> createState() => _EditVehiclePageState();
}

class _EditVehiclePageState extends State<EditVehiclePage> {

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => sl<VehicleBloc>(),
      child: Builder(
          builder: (context) {
            return BlocListener<VehicleBloc, VehicleState>(
              listener: (context, state) {
                if (state is VehicleEditSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Text(localization.vehicleseditedsuccessfully,),
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
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    localization.editvehicle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: EditVehicleForm(vehicle: widget.vehicle),
                ),),
            );
          }
      ),
    );
  }
}
