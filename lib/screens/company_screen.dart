import 'dart:io' show Platform;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyScreen extends StatefulWidget {
  final DocumentSnapshot snapshot;

  CompanyScreen(this.snapshot);

  @override
  _CompanyScreenState createState() => _CompanyScreenState(snapshot);
}

class _CompanyScreenState extends State<CompanyScreen> {
  hexColor(String colorhexcode) {
    String colornew = "0xff" + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  final DocumentSnapshot snapshot;

  _CompanyScreenState(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: (snapshot["color"] == null
              ? Colors.orange
              : Color(hexColor(snapshot["color"]))),
          elevation: 0,
          title: Text(snapshot["nome"],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ])),
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
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    color: Color(hexColor(snapshot["color"])),
                    height: 275,
                    child: CustomPaint(
                      child: Center(),
                      painter: ShapesPainter(context),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: (Platform.isAndroid) &&
                                (MediaQuery.of(context).orientation ==
                                    Orientation.landscape)
                            ? 50
                            : 20),
                    child: Center(
                      child: Container(
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  snapshot["images"]),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot["nome"] ?? "",
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.access_time,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          snapshot["horario"] ?? "Abre 08:00h fecha 18:00h",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.phone,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(snapshot["telefone"] ?? "",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                    ),
                  ]),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        (snapshot["telefone"] != "" ? "Ligar" : ""),
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: snapshot["telefone"] == ""
                          ? null
                          : () {
                              launch("tel:${snapshot["telefone"]}");
                            },
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.thumb_up,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(snapshot["social"] ?? "facebook.com/",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ),
                    ]),
              ),
              Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          (snapshot["social"] == null ? "" : "Acessar"),
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: snapshot["social"] == null
                            ? null
                            : () {
                                launch("https://" + snapshot["social"]);
                              },
                      )
                    ],
                  )),
              Container(
                color: Colors.white,
                height: 400,
              ),
            ],
          ),
        ));
  }
}

class ShapesPainter extends CustomPainter {
  final BuildContext context;

  ShapesPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // set the color property of the paint
    paint.color = Colors.white;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(
        size.width / 2,
        ((size.height / 2) +
            (size.height *
                (MediaQuery.of(context).orientation == Orientation.portrait
                    ? 0.50
                    : 1.7))));
    // draw the circle with center having radius 75.0
    canvas.drawCircle(
        center,
        (size.width) /
            (((Platform.isAndroid) &&
                    (MediaQuery.of(context).orientation ==
                        Orientation.landscape))
                ? 1.2
                : 1.5),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
