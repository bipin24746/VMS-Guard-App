import 'dart:developer';

import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/bloc/personal_staff_roles_bloc/personal_staff_roles_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_roles_entity.dart';

class PersonalStaffRoles extends StatefulWidget {
  const PersonalStaffRoles({super.key, required this.setStaffRoles,});

  final void Function(String) setStaffRoles;

  @override
  _PersonalStaffRolesState createState() => _PersonalStaffRolesState();
}

class _PersonalStaffRolesState extends State<PersonalStaffRoles> {
  String? _selectedStaffRole;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalStaffRolesBloc, PersonalStaffRolesState>(
      builder: (context, state) {
        if (state is PersonalStaffRolesLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is PersonalStaffRolesFailure) {
          return Center(child: Text(state.error));
        }

        if (state is PersonalStaffRolesFetchSuccess) {
          final personalStaffRoles = state.personalStaffRoles;

          return SizedBox(
            height: 45,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String>(
                value: _selectedStaffRole,
                hint: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Select Staff Role",
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                isExpanded: true,
                items: personalStaffRoles.map<DropdownMenuItem<String>>(
                      (PersonalStaffRolesEntity role) {
                    return DropdownMenuItem<String>(
                      value: role.name, // Assuming 'name' is the role name
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(role.name),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedStaffRole=newValue;
                    final selectedRole= personalStaffRoles.where((value)=>value.name==newValue).toList();
                    log('selected role :$selectedRole');
                    widget.setStaffRoles(selectedRole.first.id);

                  });

                },
              ),
            ),
          );
        }

        // In case none of the above states match, show a fallback message
        return Center(child: Text("No staff roles available."));
      },
    );
  }
}
