import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/pet_bloc/pet_bloc.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  // Function to pick an image using the ImagePicker
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
                localization.addpet,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    // Pet type dropdown
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton<String>(
                          value: _selectedValueType,
                          hint:  Text(
                            localization.pettype,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          isExpanded: true,
                          items: petType.map<DropdownMenuItem<String>>(
                            (String petType) {
                              return DropdownMenuItem<String>(
                                value: petType,
                                child: Text(petType),
                              );
                            },
                          ).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValueType = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Pet Name Input
                    TextFormField(
                      controller: petNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Pet Name*",
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Pet Age Input
                    TextFormField(
                      controller: petAgeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Pet Age*",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),

                    // Pet Breed Input
                    TextFormField(
                      controller: petBreedController,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: localization.petbreed,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Gender dropdown
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton<String>(
                          value: _selectedValueGender,
                          hint:  Text(
                            localization.gender,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
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
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValueGender = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Loading indicator
                    if (state is PetLoading)
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
