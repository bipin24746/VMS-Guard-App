import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/localization_bloc/localization_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/router/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  // setupLocator(); // Initialize Dependency Injection
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(324, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => sl<LocalizationBloc>(),
        child: BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (context, state) {
            return MaterialApp.router(
              locale: state.locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              // localizationsDelegates: [
              //   AppLocalizations.delegate,
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate,
              // ],
              routerConfig: AppRouter().config(),
            );
          },
        ),
      ),
    );
  }
}