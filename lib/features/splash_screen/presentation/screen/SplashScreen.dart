import 'dart:async';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    await Future.delayed(Duration(seconds: 2)); // Time to show splash screen

    if (accessToken != null && accessToken.isNotEmpty) {
      // Navigate to Home Screen if token exists
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeScreenMain()),
      // );
      AutoRouter.of(context).replace(HomeScreenMainRoute());
    } else {
      // Navigate to Login Screen if no token
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => BlocLoginPage()),
      // );
      AutoRouter.of(context).replace(BlocLoginPageRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show loading indicator
      ),
    );
  }
}
