import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/vehicle_bloc/vehicle_bloc.dart';
import 'package:dayonecontacts/features/house_hold/presentation/widgets/image_picker.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class VehicleForm extends StatefulWidget {
  const VehicleForm({super.key});

  @override
  State<VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  final List<String> vehicles = ["two_wheeler", "four_wheeler"];
  String? _selectedValue;
  File? _image;
  final TextEditingController vehicleNameController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocBuilder<VehicleBloc, VehicleState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentNode = FocusScope.of(context);
            if (currentNode.focusedChild != null &&
                !currentNode.hasPrimaryFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title:  Text(
                localization.addvehicle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
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
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  _image != null
                                      ? ClipOval(
                                          child: Image.file(
                                            _image!,
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                          ),
                                        )
                                      : const Icon(Icons.car_repair),
                                  if (_image == null)
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton<String>(
                          value: _selectedValue,
                          hint:  Text(
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
                            },
                          ).toList(),
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
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: localization.name,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Vehicle Number Input
                    TextFormField(
                      controller: vehicleNumberController,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: localization.vehiclenumber,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Loading indicator
                    if (state is VehicleLoading)
                      const Center(child: CircularProgressIndicator()),

                    // Spacer to push the button down
                    const SizedBox(height: 50),
                  ],
                ),
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
                        vehicleNameController.text.isEmpty ||
                        vehicleNumberController.text.isEmpty ||
                        _image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text(localization.pleasefillallfields),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    context.read<VehicleBloc>().add(
                          CreateVehicleEvent(
                            type: _selectedValue!,
                            name: vehicleNameController.text,
                            noplate: vehicleNumberController.text,
                            image: _image,
                          ),
                        );
                  },
                  child:  Text(
                   localization.create,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
