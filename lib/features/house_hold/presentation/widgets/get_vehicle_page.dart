import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/vehicle_bloc/vehicle_bloc.dart';
import 'package:dayonecontacts/features/house_hold/presentation/widgets/add_vehicle_button.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetVehiclePage extends StatefulWidget {
  const GetVehiclePage({
    super.key,
  });

  @override
  State<GetVehiclePage> createState() => _GetVehiclePageState();
}

class _GetVehiclePageState extends State<GetVehiclePage> {
  void _vehiclePopUp(BuildContext context, dynamic vehicle) {
    final localization = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => sl<VehicleBloc>(),
          child: Builder(
            builder: (contextone) {
              return BlocListener<VehicleBloc, VehicleState>(
                listener: (context, state) {
                  if (state is VehicleDeleteSuccess) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(localization.vehicledeletedsuccessfully),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (state is VehicleFailure) {
                    log("${localization.error}: ${state.error}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "${localization.failedtodeletevehicles}: ${state.error}"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          vehicle.name, // Access name property directly
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey,
                          backgroundImage: vehicle.imageUrl != null &&
                                  vehicle.imageUrl!.isNotEmpty
                              ? CachedNetworkImageProvider(vehicle.imageUrl!)
                              : null,
                          child: vehicle.imageUrl == null ||
                                  vehicle.imageUrl!.isEmpty
                              ? Text(
                                  vehicle.name.isNotEmpty
                                      ? vehicle.name[0].toUpperCase()
                                      : 'N',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              : null,
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          child: Text(
                            vehicle.type, // Access type property directly
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        vehicle.noplate, // Access noPlate property directly
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Handle Edit functionality and pass vehicle details
                                AutoRouter.of(context).push(
                                    EditVehicleFormRoute(vehicle: vehicle));
                                // AutoRouter.of(context).push(EditVehiclePageRoute(vehicle: '')); // Passing the vehicle to Edit page
                              },
                              child: Container(
                                height: 40,
                                width: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border:
                                      Border.all(color: Colors.orangeAccent),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      localization.edit,
                                      style:
                                          TextStyle(color: Colors.orangeAccent),
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.orangeAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                // Show the confirmation dialog when the user taps "Remove"
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        localization.removevehicle,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      content: Text(
                                          localization
                                              .areyousureyouwanttoremovethisvehicle,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                      actions: <Widget>[
                                        // "No" button - Closes the dialog
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: Text(localization.no),
                                        ),
                                        // "Yes" button - Deletes the vehicle
                                        TextButton(
                                          onPressed: () {
                                            // Accessing the VehicleBloc to dispatch DeleteVehicleEvent

                                            contextone.read<VehicleBloc>().add(
                                                DeleteVehicleEvent(
                                                    vehicleId: vehicle
                                                        .id)); // Dispatch delete event

                                            AutoRouter.of(context)
                                                .push(HouseHoldMainRoute());
                                            // Close the dialog
                                          },
                                          child: Text(localization.yes),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: Colors.redAccent),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      localization.remove,
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                    Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => sl<VehicleBloc>()..add(FetchVehiclesEvent()),
      child: BlocListener<VehicleBloc, VehicleState>(
        listener: (context, state) {
          if (state is VehicleSuccess) {
            // log("Vehicle fetched successfully");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(localization.vehiclesfetchedsucessfully),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is VehicleFailure) {
            // log("Failed to fetch Vehicle");
            // log("Error: ${state.error}");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "${localization.failedtofetchvehicle}: ${state.error}"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<VehicleBloc, VehicleState>(
          builder: (context, state) {
            if (state is VehicleLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VehicleFetchedSuccess) {
              if (state.vehicles.isEmpty) {
                return Center(child: Text(localization.novehicleavailable));
              }

              // Display pets in a row
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    children: List.generate(state.vehicles.length + 1, (index) {
                      if (index == state.vehicles.length) {
                        return AddVehicleButton();
                      } else {
                        final vehicle = state.vehicles[index];
                        return GestureDetector(
                          onTap: () {
                            _vehiclePopUp(context, vehicle);
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: CircleAvatar(
                                    radius: 23,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: vehicle.imageUrl != null
                                        ? NetworkImage(vehicle.imageUrl!)
                                        : null,
                                  ),
                                ),
                                Text(
                                  vehicle.type, // Display pet breed/type
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 8),
                                    child: Text(
                                      vehicle.name, // Display pet name
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }).reversed.toList(),
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AddVehicleButton(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
