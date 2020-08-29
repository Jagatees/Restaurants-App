import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurantsapp/screens/authenticate/authenticate.dart';
import 'package:restaurantsapp/screens/main.dart';
import 'package:restaurantsapp/screens/Main-Menu/main_meun.dart';
import 'package:restaurantsapp/screens/wrapper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Wrapper())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/burger.gif'),
      ),
    );
  }
}