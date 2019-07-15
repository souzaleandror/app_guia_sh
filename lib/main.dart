import 'dart:async';

import 'package:app_guia_sh/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "App Guia SH",
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141)),
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
    new Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/splash.jpeg", fit: BoxFit.cover),
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }
}
