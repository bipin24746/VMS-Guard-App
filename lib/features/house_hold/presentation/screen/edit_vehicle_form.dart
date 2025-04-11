import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/vehicle_entity.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/vehicle_bloc/vehicle_bloc.dart';
import 'package:dayonecontacts/features/house_hold/presentation/widgets/image_picker.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class EditVehicleForm extends StatefulWidget {
  final VehicleEntity vehicle;
  const EditVehicleForm({super.key, required this.vehicle});

  @override
  State<EditVehicleForm> createState() => _EditVehicleFormState();
}

class _EditVehicleFormState extends State<EditVehicleForm> {

  final List<String> vehicles = ["two_wheeler", "four_wheeler"];
  String? _selectedValue;
  File? _image;
  late TextEditingController vehicleNameController;
  late TextEditingController vehicleNumberController;
  final ImagePicker _picker = ImagePicker();
  void initState() {
    super.initState();

    _selectedValue = widget.vehicle.type;
    vehicleNameController = TextEditingController(text: widget.vehicle.name);
    vehicleNumberController =
        TextEditingController(text: widget.vehicle.noplate);
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  // void _pickImage(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => sl<VehicleBloc>(),
      child: Builder(builder: (context) {
        return BlocListener<VehicleBloc, VehicleState>(
          listener: (context, state) {
            if (state is VehicleEditSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(localization.vehicleupdatedsuccessfully),
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
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentNode = FocusScope.of(context);
              if (currentNode.focusedChild != null &&
                  !currentNode.hasPrimaryFocus) {
                FocusManager.instance.primaryFocus!.unfocus();
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
                child: BlocBuilder<VehicleBloc, VehicleState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Upload photo
                        Center(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    showImagePickerDialog(context, _pickImage),
                                child: Container(
                                  height: 100.0,
                                  width: 100.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      _image !=
                                              null // If a new image is selected, show it
                                          ? ClipOval(
                                              child: Image.file(
                                                _image!,
                                                fit: BoxFit.cover,
                                                width: 100,
                                                height: 100,
                                              ),
                                            )
                                          : widget.vehicle.imageUrl !=
                                                  '' // Show the network image if no new image is selected
                                              ? ClipOval(
                                                  child: Image.network(
                                                    widget.vehicle.imageUrl!,
                                                    fit: BoxFit.cover,
                                                    width: 100,
                                                    height: 100,
                                                  ),
                                                )
                                              : const Icon(Icons
                                                  .add), // Default icon if no image is available

                                      Positioned(
                                        bottom: 0,
                                        right: 5,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.orange, width: 1),
                                          ),
                                          child: const Icon(
                                            Icons.image,
                                            color: Colors.orange,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                localization.uploadphoto,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Vehicle type dropdown
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton<String>(
                              value: _selectedValue,
                              hint: Text(
                                localization.vehicletype,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              isExpanded: true,
                              items: vehicles.map<DropdownMenuItem<String>>(
                                  (String vehicle) {
                                return DropdownMenuItem<String>(
                                  value: vehicle,
                                  child: Text(vehicle),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedValue = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Name Input
                        TextFormField(
                          controller: vehicleNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: localization.name,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Vehicle Number Input
                        TextFormField(
                          controller: vehicleNumberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: localization.vehiclenumber,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Loading indicator
                        if (state is VehicleLoading)
                          const Center(child: CircularProgressIndicator()),
                      ],
                    );
                  },
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    onPressed: () {
                      if (_selectedValue == null ||
                          vehicleNumberController.text.isEmpty ||
                          vehicleNameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(localization.pleasefillallfields),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      if (_image != null) {
                        context.read<VehicleBloc>().add(
                              EditVehicleEvent(
                                id: widget.vehicle.id,
                                type: _selectedValue!,
                                name: vehicleNameController.text,
                                noplate: vehicleNumberController.text,
                                image: _image, // Send the newly selected image
                                existingImageUrl: widget.vehicle.imageUrl,
                              ),
                            );
                      } else {
                        context.read<VehicleBloc>().add(
                              EditVehicleEvent(
                                id: widget.vehicle.id,
                                type: _selectedValue!,
                                name: vehicleNameController.text,
                                noplate: vehicleNumberController.text,
                              ),
                            );
                      }
                    },
                    child: Text(
                      localization.update,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
