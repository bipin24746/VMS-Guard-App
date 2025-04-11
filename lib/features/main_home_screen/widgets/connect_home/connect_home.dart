import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import the generated localization class

class ConnectHomeContainer extends StatelessWidget {
  const ConnectHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 25.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(200),
            ),
          ),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .strengtheningBonds, // Localized text
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .ensuringSafety, // Localized text
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2, // Ensures the Divider spans the full width
                          child: Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .connectHome, // Localized text
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -26,
              right: 70,
              child: Icon(
                Icons.home,
                color: Colors.red,
                size: 150,
              ),
            ),
            Positioned(
              bottom: -30,
              right: -35,
              child: Icon(
                Icons.home,
                color: Colors.deepOrangeAccent,
                size: 170,
              ),
            ),
            Positioned(
              bottom: -35,
              right: 0,
              child: Icon(
                Icons.home,
                color: Colors.grey,
                size: 200,
              ),
            ),
          ]), // Stack
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:dayonecontacts/di/injection.dart';
// import 'package:dayonecontacts/router/app_router.dart';
//
// void main() {
//   configureDependencies();
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   MyApp({super.key});
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // Default locale (could be set based on device or user preference)
//   Locale _locale = Locale('en');
//
//   void _changeLanguage(Locale locale) {
//     setState(() {
//       _locale = locale;
//     });
//   }
//
//   final _appRouter = AppRouter();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: 'To-Do App',
//       locale: _locale, // Dynamically set locale
//       localeResolutionCallback: (deviceLocale, supportedLocales) {
//         // Handle locale resolution
//         for (var locale in supportedLocales) {
//           if (locale.languageCode == deviceLocale?.languageCode) {
//             return locale;
//           }
//         }
//         return supportedLocales.first; // Default to the first supported locale
//       },
//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [
//         Locale('en', 'US'),
//         Locale('es', 'ES'),
//       ],
//       theme: ThemeData(primarySwatch: Colors.blue),
//       routerConfig: _appRouter.config(), // Use AutoRoute
//       // Add a button or widget to change the language dynamically
//       builder: (context, child) {
//         return Column(
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Toggle between English and Spanish
//                 _changeLanguage(
//                   _locale.languageCode == 'en' ? Locale('es') : Locale('en'),
//                 );
//               },
//               child: Text(
//                 AppLocalizations.of(context)!.strengtheningBonds,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//
//             ),
//             Expanded(child: child!),
//           ],
//         );
//       },
//     );
//   }
// }
