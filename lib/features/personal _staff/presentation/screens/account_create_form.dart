import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/bloc/personal_staff_bloc/personal_staff_bloc.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/bloc/personal_staff_roles_bloc/personal_staff_roles_bloc.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/citizenship_back_image.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/citizenship_front_image.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/data_of_birth.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/mobile_number.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_blood_group.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_citizenship_number.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_emergency_number.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_gender.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_name.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_profile_photo.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/widgets/staff_roles.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class BloodGroupEntity {
  const BloodGroupEntity({
    required this.name,
    required this.value,
  });
  final String name;
  final String value;
}

@RoutePage()
class PersonalStaffAccountCreateForm extends StatefulWidget {
  const PersonalStaffAccountCreateForm({super.key});

  @override
  State<PersonalStaffAccountCreateForm> createState() =>
      _PersonalStaffAccountCreateFormState();
}

class _PersonalStaffAccountCreateFormState
    extends State<PersonalStaffAccountCreateForm> {
  final TextEditingController staffNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emergencyNumberController =
      TextEditingController();
  final TextEditingController citizenshipController = TextEditingController();
  final List<String> userGender = ["male", "female", "others"];
  final List<BloodGroupEntity> bloodGroupMap = [
    BloodGroupEntity(name: 'O+', value: 'o_positive'),
    BloodGroupEntity(name: 'O-', value: 'o_negative'),
    BloodGroupEntity(name: 'A+', value: 'a_positive'),
    BloodGroupEntity(name: 'A-', value: 'a_negative'),
    BloodGroupEntity(name: 'B+', value: 'b_positive'),
    BloodGroupEntity(name: 'B-', value: 'b_negative'),
    BloodGroupEntity(name: 'AB+', value: 'ab_positive'),
    BloodGroupEntity(name: 'AB-', value: 'ab_negative'),
  ];
  String? _selectedUserBloodType;
  String? _selectedUserGender;
  String? _selectedStaffRole;
  File? _profile;
  File? _citizenFrontImage;
  File? _citizenBackImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  void setStaffRoles(String staffRole) {
    setState(() {
      _selectedStaffRole = staffRole;
    });
  }

  Future<void> _pickProfileImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickCitizenFrontImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _citizenFrontImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickCitizenBackImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _citizenBackImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<PersonalStaffBloc>()),
        BlocProvider(
          create: (context) =>
              sl<PersonalStaffRolesBloc>()..add(FetchPersonalStaffRolesEvent()),
        ),
      ],
      child: BlocBuilder<PersonalStaffBloc, PersonalStaffState>(
        builder: (context, state) {
          return BlocListener<PersonalStaffBloc, PersonalStaffState>(
            listener: (context, state) {
              if (state is PersonalStaffSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Staff Added Successfully"),
                    backgroundColor: Colors.green,
                  ),
                );
                AutoRouter.of(context).push(PersonalStaffStatusRoute());
              } else if (state is PersonalStaffFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
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
                  backgroundColor: Colors.white,
                  title: Text(
                    "Create Account for Staff",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.5),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StaffProfilePhoto(
                          profileImage: _profile,
                          onPickImage: _pickProfileImage,
                        ),
                        SizedBox(height: 10),
                        PersonalStaffName(
                            staffNameController: staffNameController),
                        SizedBox(
                          height: 10,
                        ),
                        DateOfBirth(dobController: dobController),
                        SizedBox(
                          height: 10,
                        ),
                        StaffMobileNumber(
                            mobileNumberController: mobileNumberController),
                        SizedBox(
                          height: 10,
                        ),
                        StaffEmergencyNumber(
                            emergencyNumberController:
                                emergencyNumberController),
                        SizedBox(
                          height: 10,
                        ),
                        BloodGroupDropdown(
                          selectedBloodGroup: _selectedUserBloodType,
                          bloodGroupList: bloodGroupMap,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedUserBloodType = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GenderDropdown(
                          selectedGender: _selectedUserGender,
                          genderList: userGender,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedUserGender = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PersonalStaffRoles(
                          setStaffRoles: setStaffRoles,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        StaffCitizenshipNumber(
                            citizenshipController: citizenshipController),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: DecoratedBox(
                            decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Add Citizenship Photo"),
                                  Row(
                                    children: [
                                      StaffCitizenshipFrontImage(
                                          citizenFrontImage: _citizenFrontImage,
                                          pickCitizenFrontImage:
                                              _pickCitizenFrontImage),
                                      StaffCitizenshipBackImage(
                                          citizenBackImage: _citizenBackImage,
                                          pickCitizenBackImage:
                                              _pickCitizenBackImage)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent),
                      onPressed: () {
                        log('name : ${staffNameController.text}   mobile number :${mobileNumberController.text},dob:${dobController.text}  emergency number: ${emergencyNumberController.text} blood type:$_selectedUserBloodType gender :$_selectedUserGender staff role:$_selectedStaffRole citizen ship number :${citizenshipController.text} front image:$_citizenFrontImage back image: $_citizenBackImage profile image : $_profile');
                        if (staffNameController.text.isEmpty ||
                            mobileNumberController.text.isEmpty ||
                            emergencyNumberController.text.isEmpty ||
                            _selectedUserBloodType == null ||
                            _selectedUserGender == null ||
                            _selectedStaffRole == null ||
                            citizenshipController.text.isEmpty ||
                            _profile == null ||
                            _citizenFrontImage == null ||
                            _citizenFrontImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("pleasefillallfields"),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        context
                            .read<PersonalStaffBloc>()
                            .add(CreatePersonalStaffEvent(
                              name: staffNameController.text,
                              contact: mobileNumberController.text,
                              econtact: emergencyNumberController.text,
                              bloodGroup: _selectedUserBloodType!,
                              gender: _selectedUserGender!,
                              staffRoleId: _selectedStaffRole!,
                              citizenshipNo: citizenshipController.text,
                              dob: dobController.text,
                              profile: _profile!,
                              citizenshipFrontImage: _citizenFrontImage,
                              citizenshipBackImage: _citizenBackImage,
                            ));
                      },
                      child: Text(
                        "Create",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
