import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/screens/pending_status.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class PersonalStaffStatus extends StatefulWidget {

  const PersonalStaffStatus({super.key});

  @override
  State<PersonalStaffStatus> createState() => _PersonalStaffStatusState();
}

class _PersonalStaffStatusState extends State<PersonalStaffStatus> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () async{
        AutoRouter.of(context).replace(HomeScreenMainRoute());
        return false;
      },
      child: DefaultTabController(
        length: 3, // Define the number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              localization.yourpersonalstaff,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(tabs: [
              Tab(text: localization.working),
              Tab(text: localization.pending),
              Tab(text: localization.rejected),
            ]),
          ),
          body: TabBarView(children: [
            Center(
              child: Text(localization.working),
            ),
            Center(child: PendingStatus()),
            Center(child: Text(localization.rejected)),
          ]),
          floatingActionButton: GestureDetector(

          onTap: (){
            AutoRouter.of(context).push(PersonalStaffAccountCreateFormRoute());
          },
           child: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                radius: 30.r,
                child: Icon(
                  Icons.add,
                  size: 30.sp,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
