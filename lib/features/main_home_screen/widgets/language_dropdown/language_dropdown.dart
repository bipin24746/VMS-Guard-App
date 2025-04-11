import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/localization_bloc/localization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String? _selectedLanguage;

  final List<Map<String, dynamic>> languages = [
    {'language': 'English', 'code': 'en'},
    {'language': 'Spanish', 'code': 'es'},
    {'language': 'नेपाली', 'code': 'ne'},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, localizationState) {
        // Set the selected language to the current localization state language code
        _selectedLanguage = localizationState.locale.languageCode;

        return Padding(
          padding:  EdgeInsets.all(8.0.w),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3.w,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: DropdownButton<String>(
                value: _selectedLanguage,
                hint: Center(
                  child:  Text(
                    "Languages",
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                isExpanded: true,
                items: languages.map<DropdownMenuItem<String>>(
                      (Map<String, dynamic> language) {
                    return DropdownMenuItem<String>(
                      value: language['code'],
                      child: Center(child: Text(language['language'])),
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
          ),
        );
      },
    );
  }
}
