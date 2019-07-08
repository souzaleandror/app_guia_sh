import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CompanyScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(snapshot["nome"]),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(snapshot["images"], fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot["nome"] ?? "",
                          style: TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.bold)),
                      Text(snapshot["telefone"] ?? "",
                          style: TextStyle(fontSize: 20.0)),
                      Text(snapshot["endereco"] ?? "",
                          style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
