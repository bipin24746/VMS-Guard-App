import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class CommonAppBar  extends StatelessWidget implements  PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
    title: Text(
      "Invite Guest",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    bottom: ButtonsTabBar(
      backgroundColor: Color(0xFF34405F),
      height: 50,
      width: MediaQuery.of(context).size.width / 2,
      radius: 0,
      unselectedLabelStyle: TextStyle(color: Colors.black),
      contentCenter: true,
      tabs: [
        Tab(
          text: "Add Manually",
        ),
        Tab(
          text: "Add From Contact",
        ),
      ],
    ),
        );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
