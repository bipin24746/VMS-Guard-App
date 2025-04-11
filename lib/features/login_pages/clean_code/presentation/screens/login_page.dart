import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/localization_bloc/localization_bloc.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class BlocLoginPage extends StatefulWidget {
  const BlocLoginPage({super.key});

  @override
  State<BlocLoginPage> createState() => _BlocLoginPageState();
}

class _BlocLoginPageState extends State<BlocLoginPage> {
  final List<Map<String, dynamic>> languages = [
    {'language': 'English', 'code': 'en'},
    {'language': 'Spanish', 'code': 'es'},
    {'language': 'नेपाली', 'code': 'ne'},
  ];

  final TextEditingController _phoneNoController = TextEditingController();
  bool _isPhoneNumberValid = false;
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _phoneNoController.addListener(_validatePhoneNumber);
  }

  void _validatePhoneNumber() {
    final isValid = _phoneNoController.text.isNotEmpty &&
        int.tryParse(_phoneNoController.text) != null &&
        _phoneNoController.text.length == 10;

    if (_isPhoneNumberValid != isValid) {
      setState(() {
        _isPhoneNumberValid = isValid;
      });
    }
  }

  @override
  void dispose() {
    _phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Builder(
        builder: (context) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Otp Sent Successfully.")),
                );

                AutoRouter.of(context).push(OtpPageRoute(
                  hash: state.authResponseEntity.authResponseDataEntity?.hash ?? '',
                  otp: state.authResponseEntity.authResponseDataEntity?.otp ?? '',
                  phoneNo: _phoneNoController.text,
                ));
              } else if (state is AuthErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.errorMessage}')),
                );
              }
            },
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(200),
                  child: AppBar(
                    backgroundColor: Colors.white,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Image.asset("lib/assets/images/signupimage.png"),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localization.beginyourjourneytohome,
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          localization
                              .pleaseenteryourmobilenumbertocreateyouraccount,
                          style: TextStyle(fontSize: 12),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.flag, color: Colors.red),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: _phoneNoController,
                                  decoration: InputDecoration(
                                    labelText: localization.mobilenumber,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        BlocBuilder<LocalizationBloc, LocalizationState>(
                          builder: (context, localizationState) {
                            _selectedLanguage =
                                localizationState.locale.languageCode;

                            return SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton<String>(
                                  value: _selectedLanguage,
                                  hint: Center(
                                    child: const Text(
                                      "Languages",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  isExpanded: true,
                                  items: languages.map<DropdownMenuItem<String>>(
                                    (Map<String, dynamic> language) {
                                      return DropdownMenuItem<String>(
                                        value: language['code'],
                                        child: Center(
                                            child: Text(language['language'])),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedLanguage = newValue;
                                    });

                                    if (newValue != null) {
                                      context.read<LocalizationBloc>().add(
                                            ChangeLanguageEvent(Locale(newValue)),
                                          );
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 15,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      onPressed: _isPhoneNumberValid
                          ? () {
                              context.read<AuthBloc>().add(
                                  AuthUserEvent(phoneNo: _phoneNoController.text));
                            }
                          : null,
                      child: const Text(
                        "Continue"
                        ,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
