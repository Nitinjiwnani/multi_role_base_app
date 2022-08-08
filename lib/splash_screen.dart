import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_base_app/home_screen.dart';
import 'package:multi_role_base_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin') ?? false;
    if (isLogin) {
      Timer(
        Duration(seconds: 3),
        () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: AssetImage('lib/images/splash_screen.jpeg')),
    );
  }
}
