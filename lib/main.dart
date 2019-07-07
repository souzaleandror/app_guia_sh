import 'dart:async';

import 'package:app_guia_sh/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "App Guia SH",
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  )); // Column, MaterialApp
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 1),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/splash.jpeg", fit: BoxFit.cover, height: 1000.0),
      ],
    );
  }
}
