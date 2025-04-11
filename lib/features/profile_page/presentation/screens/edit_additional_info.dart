import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_entity/user_profile_entity.dart';
import 'package:dayonecontacts/features/profile_page/presentation/bloc/user_profile_bloc.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage()
class EditAdditionalInfo extends StatefulWidget {
  final UserProfileEntity userProfileEntity;
  const EditAdditionalInfo({super.key, required this.userProfileEntity});

  @override
  State<EditAdditionalInfo> createState() => _EditAdditionalInfoState();
}

class _EditAdditionalInfoState extends State<EditAdditionalInfo> {
  final List<String> userGender = ["male", "female", "others"];

  // Blood group shorthand and full values mapping
  final Map<String, String> bloodGroupMap = {
    "O+": "o_positive",
    "O-": "o_negative",
    "A+": "a_positive",
    "A-": "a_negative",
    "B+": "b_positive",
    "B-": "b_negative",
    "AB+": "ab_positive",
    "AB-": "ab_negative",
  };

  final List<String> userBloodGroup = [
    "O+",
    "O-",
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-"
  ];

  String? _selectedUserGender;
  String? _selectedUserBloodType;
  String? _selectedDOB;
  TextEditingController editNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the form fields with the data from userProfileEntity
    editNameController.text = widget.userProfileEntity.name ?? '';
    _selectedUserGender = widget.userProfileEntity.gender ?? '';

    // Make sure we map the full blood group back to shorthand for dropdown
    _selectedUserBloodType = bloodGroupMap.entries
            .firstWhere(
              (entry) => entry.value == widget.userProfileEntity.bloodgroup,
              orElse: () => MapEntry("", ""),
            )
            .key ??
        '';

    _selectedDOB = widget.userProfileEntity.dob ?? '';
  }

  // Function to format the Date of Birth
  String _formatDateOfBirth(String dob) {
    final localization = AppLocalizations.of(context)!;
    if (dob.isNotEmpty) {
      try {

        DateTime date = DateTime.parse(dob);
        return DateFormat(localization.mmddyyyy).format(date);
        // return DateFormat('MMM dd yyyy').format(date);
      } catch (e) {
        return "-";
      }
    }
    return "-";
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: Colors.blue,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != currentDate) {
      final localization = AppLocalizations.of(context)!;
      setState(() {
        // Format the picked date using DateFormat
        _selectedDOB = DateFormat(localization.mmddyyyy).format(picked);
        // _selectedDOB = DateFormat('MMM dd yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => sl<UserProfileBloc>(),
      child: BlocConsumer<UserProfileBloc, UserProfileState>(
        listener: (context, state) {
          if (state is UserProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is EditUserInfoSuccess) {
            AutoRouter.of(context).push(ProfilePageRoute());
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(localization.success)));
          }
        },
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
                title: Text(localization.editadditionalinfo),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Name input field
                      TextFormField(
                        controller: editNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: localization.name,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Gender dropdown
                      DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: DropdownButton<String>(
                            value: _selectedUserGender,
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                localization.selectgender,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            isExpanded: true,
                            items: userGender.map<DropdownMenuItem<String>>(
                                (String userGender) {
                              return DropdownMenuItem<String>(
                                value: userGender,
                                child: Text(userGender),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedUserGender = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Blood group dropdown
                      DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: DropdownButton<String>(
                            value: _selectedUserBloodType,
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                localization.bloodgroup,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            isExpanded: true,
                            items: userBloodGroup.map<DropdownMenuItem<String>>(
                                (String bloodGroup) {
                              return DropdownMenuItem<String>(
                                  value: bloodGroup, child: Text(bloodGroup));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedUserBloodType = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Date of birth picker
                      SizedBox(
                        height: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _selectedDOB != null
                                        ? _formatDateOfBirth(_selectedDOB!)
                                        : localization.selectdateofbirth,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(Icons.calendar_today),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                      if (_selectedUserBloodType == null ||
                          _selectedUserGender == null ||
                          editNameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(localization.pleasefillallfields),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      // Get the full value of the selected blood group
                      String selectedBloodGroupFull =
                          bloodGroupMap[_selectedUserBloodType!]!;

                      // Send the request with the full blood group value
                      context.read<UserProfileBloc>().add(EditUserInfoEvent(
                            id: widget.userProfileEntity.id,
                            name: editNameController.text,
                            gender: _selectedUserGender!,
                            dob: _selectedDOB!,
                            bloodgroup: selectedBloodGroupFull,
                          ));
                    },
                    child: state is UserProfileLoading
                        ? CircularProgressIndicator()
                        : Text(
                            localization.update,
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
          );
        },
      ),
    );
  }
}
