import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/connect_home/connect_home.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/presentation/bloc/current_flat_bloc.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/presentation/screens/current_flat_clean.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_notices/presentation/bloc/notice_bloc.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_notices/presentation/pages/current_notices.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/language_dropdown/language_dropdown.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/navbar/home_navbar.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/ongoing_polls/ongoing_polls.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/personal_staff/personal_staff.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/services/services.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/sqflite_button/sqf_lite_button.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/visitors_list/home_visitors.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreenMain extends StatelessWidget {
  const HomeScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<NoticeBloc>()..add(FetchNotices()),
        ),
        BlocProvider(
            create: (context) =>
            sl<CurrentFlatBloc>()..add(FetchCurrentFlat())),
      ],
      child: Builder(builder: (context) {
        return WillPopScope(
          onWillPop: () async {

            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                CommonHomeNavBar(),
                HomeVisitors(),
                ServicesHome(),
                PersonalStaffHome(),
                SizedBox(height: 30.h), // Add spacing between widgets
                const CurrentNoticeHome(), // BlocProvider for NoticeBloc
                OngoingPollsHome(),
                ConnectHomeContainer(),
                CurrentFlatClean(),
                LanguageDropdown(),
                SizedBox(height: 20.h), // Space before the button
              ],
            ),
            floatingActionButton: SqfLiteButton(),
          ),
          
        );
      }),
    );
  }
}
