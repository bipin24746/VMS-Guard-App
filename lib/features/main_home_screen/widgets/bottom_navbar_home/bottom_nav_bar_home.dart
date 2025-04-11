import 'package:dayonecontacts/features/home_screen_pages/home_screen.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/navbar/home_navbar.dart';
import 'package:dayonecontacts/l10n/l10n.dart';
import 'package:flutter/material.dart';

class BottomNavBarHome extends StatefulWidget {
  const BottomNavBarHome({super.key});

  @override
  State<BottomNavBarHome> createState() => _BottomNavBarHomeState();
}

class _BottomNavBarHomeState extends State<BottomNavBarHome> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CommonHomeNavBar(),
          body: TabBarView(
            children: [
              HomeScreenMain(),
              Icon(Icons.directions_transit, size: 350),
              Icon(Icons.add),
              Icon(Icons.directions_car, size: 350),
              Icon(Icons.directions_bike, size: 350),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 75,
            child: TabBar(
              tabs: [
                Column(
                  children: [
                    Tab(
                      icon: Icon(Icons.home),
                      text: localization.home,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Tab(
                      icon: Icon(Icons.notifications),
                      text: localization.notice,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Tab(
                      icon: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top:
                                -33, // Moves the icon upward to make it appear half-outside
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    shape: BoxShape.circle,
                                  ),
                                  child:
                                      Icon(Icons.qr_code, color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Text(localization.explore,),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Tab(
                      icon: Icon(Icons.sos),
                      text: localization.sos,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Tab(
                      icon: Icon(Icons.person),
                      text: localization.profile,
                    ),
                  ],
                ),
              ],

              labelColor: Colors.purple,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.white, // Active tab indicator color
            ),
          ),
        ),
      ),
    );
  }
}
