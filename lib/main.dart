import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: "App Guia SH", home: Home())); // Column, MaterialApp
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/splash.jpeg", fit: BoxFit.cover, height: 1000.0),
      ],
    );
  }
}
