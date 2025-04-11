import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/pet_entity.dart';
import 'package:dayonecontacts/features/house_hold/presentation/bloc/pet_bloc/pet_bloc.dart';
import 'package:dayonecontacts/features/house_hold/presentation/widgets/image_picker.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class EditPetForm extends StatefulWidget {
  final PetEntity pet;
  const EditPetForm({super.key, required this.pet});

  @override
  State<EditPetForm> createState() => _PetFormState();
}

class _PetFormState extends State<EditPetForm> {

  final List<String> petType = ["dog", "cat", "bird", "other"];
  final List<String> petGender = ["male", "female"];
  String? _selectedValueType;
  String? _selectedValueGender;
  File? _image;
  late TextEditingController petNameController;
  late TextEditingController petAgeController;
  late TextEditingController petBreedController;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    _selectedValueType =
        widget.pet.typee.isNotEmpty == true ? widget.pet.typee : petType[0];
    _selectedValueGender =
        widget.pet.gender.isNotEmpty == true ? widget.pet.gender : petGender[0];

    petNameController = TextEditingController(text: widget.pet.name);
    petAgeController = TextEditingController(text: widget.pet.age);
    petBreedController = TextEditingController(text: widget.pet.breed);
  }

  // Function to pick an image using the ImagePicker
  Future<void> _pickImage(ImageSource source) async {
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
              title: Text(
                localization.editpet,
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
                                      : widget.pet.imageUrl !=
                                              '' // Show the network image if no new image is selected
                                          ? ClipOval(
                                              child: Image.network(
                                                widget.pet.imageUrl!,
                                                fit: BoxFit.cover,
                                                width: 100,
                                                height: 100,
                                              ),
                                            )
                                          : const Icon(Icons
                                              .add), // Default icon if no image is available

                                  // Show the image icon when no image is selected
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
                          hint: Text(
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: localization.petname,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Pet Age Input
                    TextFormField(
                      controller: petAgeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: localization.petage,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),

                    // Pet Breed Input
                    TextFormField(
                      controller: petBreedController,
                      decoration: InputDecoration(
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
                          hint: Text(
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
                        petBreedController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(localization.pleasefillallfields),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    if (_image != null) {
                      context.read<PetBloc>().add(
                            EditPetEvent(
                              typee: _selectedValueType!,
                              name: petNameController.text,
                              age: petAgeController.text,
                              breed: petBreedController.text,
                              image: _image,
                              gender: _selectedValueGender!,
                              id: widget.pet.id,
                            ),
                          );
                    } else {
                      context.read<PetBloc>().add(
                            EditPetEvent(
                              typee: _selectedValueType!,
                              name: petNameController.text,
                              age: petAgeController.text,
                              breed: petBreedController.text,
                              gender: _selectedValueGender!,
                              id: widget.pet.id,
                            ),
                          );
                    }
                  },
                  child: Text(
                    localization.updatepet,
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
