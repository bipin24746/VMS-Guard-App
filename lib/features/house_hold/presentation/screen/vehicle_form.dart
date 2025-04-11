import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/vehicle_bloc/vehicle_bloc.dart';
import 'package:dayonecontacts/features/house_hold/presentation/widgets/image_picker.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                localization.addvehicle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(12.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => showImagePickerDialog(context, _pickImage),
                            child: Container(
                              height: 100.w,
                              width: 100.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  _image != null
                                      ? ClipOval(
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                      width: 100.w,
                                      height: 100.w,
                                    ),
                                  )
                                      : Icon(Icons.car_repair, size: 30.sp),
                                  if (_image == null)
                                    Positioned(
                                      bottom: 0,
                                      right: 5.w,
                                      child: Container(
                                        padding: EdgeInsets.all(5.w),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.orange, width: 1.w),
                                        ),
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.orange,
                                          size: 15.sp,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            localization.uploadphoto,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Vehicle type dropdown
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: DropdownButton<String>(
                          value: _selectedValue,
                          hint: Text(
                            localization.vehicletype,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
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
                    SizedBox(height: 10.h),

                    // Name Input
                    TextFormField(
                      controller: vehicleNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: localization.name,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                      ],
                    ),
                    SizedBox(height: 10.h),

                    // Vehicle Number Input
                    TextFormField(
                      controller: vehicleNumberController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: localization.vehiclenumber,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // Loading indicator
                    if (state is VehicleLoading)
                      const Center(child: CircularProgressIndicator()),

                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(18.w),
              child: SizedBox(
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
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
                  child: Text(
                    localization.create,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
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
