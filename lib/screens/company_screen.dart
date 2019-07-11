import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(snapshot["nome"] +
                    " - " +
                    snapshot["telefone"] +
                    " - " +
                    snapshot["endereco"]);
              },
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            CachedNetworkImage(
              placeholder: CircularProgressIndicator(),
              errorWidget: Icon(Icons.error),
              fadeOutDuration: Duration(seconds: 1),
              fadeInDuration: Duration(seconds: 2),
              imageUrl: snapshot["images"],
              fit: BoxFit.cover,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(snapshot["nome"] ?? "",
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold)),
                  Text(snapshot["telefone"] ?? "",
                      style: TextStyle(fontSize: 20.0)),
                  Text(snapshot["endereco"] ?? "",
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      onPressed: () {
                        launch(
                            "https://www.google.com/maps/search/?api=1&query=${snapshot["lat"]},"
                            "${snapshot["long"]}");
                      },
                      child: Text(
                        "Ver no mapa",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      onPressed: () {
                        launch("tel:${snapshot["telefone"]}");
                      },
                      child: Text(
                        "Ligar",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ));
  }
}
