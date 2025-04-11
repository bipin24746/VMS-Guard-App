import 'package:dayonecontacts/features/invite_guest/widgets/addManuallyRefractored/ContactCard.dart';
import 'package:dayonecontacts/features/invite_guest/widgets/addManuallyRefractored/VisitorList.dart';
import 'package:dayonecontacts/features/invite_guest/widgets/addManuallyRefractored/nameFromField.dart';
import 'package:dayonecontacts/features/invite_guest/widgets/addManuallyRefractored/numberFormField.dart';

import 'package:dayonecontacts/common/widgets/SubmitButton.dart';
import 'package:dayonecontacts/l10n/l10n.dart';

import 'package:flutter/material.dart';

class AddManually extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) selectContacts;
  const AddManually({super.key, required this.selectContacts});

  @override
  State<AddManually> createState() => _AddManuallyState();
}

class _AddManuallyState extends State<AddManually> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final List<String> names = [];
  final List<String> numbers = [];
  final List<int> selectedIndexes = [];

  bool _isFormValid = true;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _numberController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.removeListener(_validateForm);
    _numberController.removeListener(_validateForm);
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid = _nameController.text.isNotEmpty &&
        _numberController.text.isNotEmpty &&
        int.tryParse(_numberController.text) != null &&
        _numberController.text.length == 10;

    if (_isFormValid != isValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        names.add(_nameController.text);
        numbers.add(_numberController.text);
        _nameController.clear();
        _numberController.clear();
        _isFormValid = false; // Reset button state after submission.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              NameFormFieldWidgets(
                controller: _nameController,
                hintText: localization.entername,
              ),

              // ),
              NumberFormField(
                controller: _numberController,
                hinttext: localization.enternumber,
              ),

              CustomButton(
                isFormValid: _isFormValid,
                submitForm: () {
                  _submitForm();
                },
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Divider(color: Colors.grey, thickness: 1),
              ),
              VisitorListone(
                title: localization.frequentvisitorlist,
                description:
                    localization.guestwhofrequentlyvisitherewillbeshownhere,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndexes.contains(index);
                    return ContactCard(
                        name: names[index],
                        numbers: numbers[index],
                        isSelected: isSelected,
                        onToggleSelection: () {
                          setState(() {
                            if (isSelected) {
                              selectedIndexes.remove(index);
                            } else {
                              selectedIndexes.add(index);
                            }
                            widget.selectContacts(
                              selectedIndexes
                                  .map((i) => {
                                        // 'name': names[i],
                                        localization.name: names[i],
                                        // 'number': numbers[i],
                                        localization.number: numbers[i],
                                      })
                                  .toList(),
                            );
                          });
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
