import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/features/personal%20_staff/presentation/screens/pending_status.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PersonalStaffStatus extends StatefulWidget {

  const PersonalStaffStatus({super.key});

  @override
  State<PersonalStaffStatus> createState() => _PersonalStaffStatusState();
}

class _PersonalStaffStatusState extends State<PersonalStaffStatus> {
  @override
  Widget build(BuildContext context) {
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
              "Your Personal Staff",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(tabs: [
              Tab(text: "Working"),
              Tab(text: "Pending"),
              Tab(text: "Rejected"),
            ]),
          ),
          body: TabBarView(children: [
            Center(
              child: Text("Working"),
            ),
            Center(child: PendingStatus()),
            Center(child: Text("Rejected")),
          ]),
          floatingActionButton: GestureDetector(

          onTap: (){
            AutoRouter.of(context).push(PersonalStaffAccountCreateFormRoute());
          },
           child: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                radius: 30,
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
