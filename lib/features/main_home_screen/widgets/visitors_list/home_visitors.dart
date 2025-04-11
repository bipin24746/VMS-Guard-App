import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/visitors_list/visitors_list.dart';
import 'package:dayonecontacts/l10n/l10n.dart';

import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  AutoRouter.of(context).push(BlocLoginPageRoute());
}

class HomeVisitors extends StatefulWidget {
  @override
  State<HomeVisitors> createState() => _HomeVisitorsState();
}

class _HomeVisitorsState extends State<HomeVisitors> {
  bool isExpanded = false;

  // Navigate to different pages based on the visitor selection
  void _navigateToPage(BuildContext context, String visitorType) {
    switch (visitorType) {
      case "Guest":
        break;
      case "Delivery":
        break;
      case "Ride Sharing":
        AutoRouter.of(context).push(HouseHoldMainRoute());

        break;

      case "Services":
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Container(
      height: isExpanded ? 320 : null,
      decoration: BoxDecoration(
        color: Color(0xFFeff4ff),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(left: 18.0, top: 18, bottom: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                localization.visitors,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                localization.six,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () => _logout(context), // Fixed onPressed
                child: Row(
                  children: [
                    Text(localization.logout),
                    // Text("View all"),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: SizedBox(
                  height: 95,
                  width: 80,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            isExpanded
                                ? Column(
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text(
                                        localization.close,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text(
                                        localization.addvisitor,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      activeStatus.length,
                      (index) {
                        final people = activeStatus[index];
                        final isOnline = people['status'] == 'online';

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        isOnline ? Colors.green : Colors.grey,
                                    width: 3,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        width: 70,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(people['images']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 0,
                                      child: Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isOnline
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            people['shared'],
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                people['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isExpanded)
            Container(
              child: Column(
                children: [
                  Divider(
                    thickness: 1,
                    color: Colors.red,
                  ),
                  Row(
                    children: [
                      Text(
                        localization.allowfutureentriesforeasywaytogetinfromthegate,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(hiddenVisitors.length, (index) {
                          final visibleItem =
                              hiddenVisitors[index]; // Access the map
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                _navigateToPage(context, visibleItem["text"]);
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    visibleItem[
                                        "iconVisible"], // Access the icon key
                                    size: 40,
                                  ),
                                  SizedBox(height: 5), // Add spacing
                                  Text(
                                    visibleItem["text"], // Access the text key
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
