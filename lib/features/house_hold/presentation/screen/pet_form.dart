import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/pet_bloc/pet_bloc.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/image_picker.dart';

@RoutePage()
class PetForm extends StatefulWidget {
  const PetForm({super.key});

  @override
  State<PetForm> createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final List<String> petType = ["dog", "cat", "bird", "others"];
  final List<String> petGender = ["male", "female"];
  String? _selectedValueType;
  String? _selectedValueGender;
  File? _image;
  final TextEditingController petNameController = TextEditingController();
  final TextEditingController petAgeController = TextEditingController();
  final TextEditingController petBreedController = TextEditingController();
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

    return BlocBuilder<PetBloc, PetState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                localization.addpet,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
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
                              height: 100.h,
                              width: 90.w,
                              decoration: const BoxDecoration(shape: BoxShape.circle),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  _image != null
                                      ? ClipOval(
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                      width: 90.w,
                                      height: 100.h,
                                    ),
                                  )
                                      : Icon(Icons.pets, size: 40.sp),
                                  if (_image == null)
                                    Positioned(
                                      bottom: 0,
                                      right: 5.w,
                                      child: Container(
                                        padding: EdgeInsets.all(5.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(color: Colors.orange, width: 1.w),
                                        ),
                                        child: Icon(Icons.image, color: Colors.orange, size: 15.sp),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            localization.uploadphoto,
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Pet type dropdown
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: DropdownButton<String>(
                          value: _selectedValueType,
                          hint: Text(
                            localization.pettype,
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                          isExpanded: true,
                          items: petType.map<DropdownMenuItem<String>>(
                                (String type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                              );
                            },
                          ).toList(),
                          onChanged: (newValue) => setState(() => _selectedValueType = newValue),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    // Pet name
                    TextFormField(
                      controller: petNameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Pet Name*",
                      ),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                    ),
                    SizedBox(height: 10.h),

                    // Pet age
                    TextFormField(
                      controller: petAgeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Pet Age*",
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.h),

                    // Pet breed
                    TextFormField(
                      controller: petBreedController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: localization.petbreed,
                      ),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                    ),
                    SizedBox(height: 20.h),

                    // Gender dropdown
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: DropdownButton<String>(
                          value: _selectedValueGender,
                          hint: Text(
                            localization.gender,
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                          isExpanded: true,
                          items: petGender.map<DropdownMenuItem<String>>(
                                (String gender) {
                              return DropdownMenuItem<String>(
                                value: gender,
                                child: Text(gender),
                              );
                            },
                          ).toList(),
                          onChanged: (newValue) => setState(() => _selectedValueGender = newValue),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    if (state is PetLoading)
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
                    if (_selectedValueType == null ||
                        _selectedValueGender == null ||
                        petNameController.text.isEmpty ||
                        petAgeController.text.isEmpty ||
                        petBreedController.text.isEmpty ||
                        _image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(localization.pleasefillallfields),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    context.read<PetBloc>().add(
                      CreatePetEvent(
                        type: _selectedValueType!,
                        name: petNameController.text,
                        age: petAgeController.text,
                        breed: petBreedController.text,
                        image: _image,
                        gender: _selectedValueGender!,
                      ),
                    );
                  },
                  child: Text(
                    localization.create,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
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
