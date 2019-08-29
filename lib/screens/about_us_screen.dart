import 'dart:io' show Platform;

import 'package:app_guia_sh/screens/home_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  bool _getCompanyIsOpen() {
    final now = new DateTime.now();
    final String actual_date = DateFormat("yyyy-MM-dd").format(now);
    final date_open = DateTime.parse(actual_date + " 08:00:00");
    final date_close = DateTime.parse(actual_date + " 18:00:00");

    if ((now.isAfter(date_open)) && (now.isBefore(date_close)))
      return true;
    else
      return false;
  }

  String _getNameSocialMedia(String name) {
    if (name.isNotEmpty) {
      name = name.replaceAll(RegExp(r"\s+\b|\b\s"), "");
      name = name.toLowerCase();
      return name;
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //drawer: CustomDrawer(_pageController),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        title: Text("Guia 66",
            style: TextStyle(shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ])),
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share("Guia 66");
            },
          )
        ],
      ),
      body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: FutureBuilder<DocumentSnapshot>(
              initialData: null,
              future: Firestore.instance
                  .collection("about_us")
                  .document("wbnh2TahxZ1oI1ild59n")
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    height: 200.0,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  );
                } else {
                  return Column(children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.orange,
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
                                      snapshot.data["logo"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 310),
                          child: Image.asset(
                            (_getCompanyIsOpen()
                                ? "images/aberto.png"
                                : "images/fechado.png"),
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(snapshot.data["name"] ?? "",
                              style: TextStyle(
                                  fontSize: 28.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              snapshot.data["slogan"] ?? "Venha nos conhecer !",
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 60,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 60,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 60,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 60,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 60,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 20),
                              child: Icon(
                                Icons.access_time,
                                color: _getCompanyIsOpen()
                                    ? Colors.green
                                    : Colors.red,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 50, top: 25),
                              child: Text(
                                  snapshot.data["horario"] ??
                                      "Abre 08:00h / Fecha 18:00h",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
//                    Align(
//                      alignment: Alignment.topRight,
//                      child: Padding(
//                        padding: EdgeInsets.only(right: 15, top: 28),
//                        child: Text(
//                            (_getCompanyIsOpen() ? "Aberto" : "Fechado"),
//                            style: TextStyle(
//                                fontSize: 18.0,
//                                color: (_getCompanyIsOpen()
//                                    ? Colors.green
//                                    : Colors.red))),
//                      ),
//                    )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 20),
                              child: Icon(
                                Icons.phone,
                                color: _getCompanyIsOpen()
                                    ? Colors.green
                                    : Colors.red,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 50, top: 25),
                              child: Text(snapshot.data["telefone"] ?? "",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 2, top: 10),
                                child: FlatButton(
                                  child: Text(
                                    (snapshot.data["telefone"] != ""
                                        ? "Ligar"
                                        : ""),
                                    style: TextStyle(
                                        color: _getCompanyIsOpen()
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 18.0),
                                  ),
                                  onPressed:
                                      ((snapshot.data["telefone"] == "") ||
                                              (_getCompanyIsOpen()))
                                          ? null
                                          : () {
                                              launch(
                                                  "tel:${snapshot.data["telefone"]}");
                                            },
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 20),
                              child: Icon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.green,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 50, top: 25),
                              child: Text(snapshot.data["celular"] ?? "",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 2, top: 10),
                                child: FlatButton(
                                  child: Text(
                                    (snapshot.data["celular"] != ""
                                        ? "Ligar"
                                        : ""),
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18.0),
                                  ),
                                  onPressed: snapshot.data["celular"] == ""
                                      ? null
                                      : () {
                                          launch(
                                              "tel:${snapshot.data["celular"]}");
                                        },
                                )),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 48, top: 10),
                                child: FlatButton(
                                  child: Text(
                                    (snapshot.data["celular"] != ""
                                        ? "Add / "
                                        : ""),
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18.0),
                                  ),
                                  onPressed: snapshot.data["celular"] == ""
                                      ? null
                                      : () {
                                          launch(
                                              "tel:${snapshot.data["celular"]}");
                                        },
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 20),
                              child: Icon(
                                Icons.email,
                                color: Colors.green,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 50, top: 25),
                              child: Text(snapshot.data["email"] ?? "",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 2, top: 10),
                                child: FlatButton(
                                  child: Text(
                                    (snapshot.data["email"] != ""
                                        ? "Enviar Email"
                                        : ""),
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 18.0),
                                  ),
                                  onPressed: ((snapshot.data["email"] == "") ||
                                          (_getCompanyIsOpen()))
                                      ? null
                                      : () {
                                          launch(
                                              "mailto:${snapshot.data["email"]}");
                                        },
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                                icon: new Icon(
                                  FontAwesomeIcons.facebook,
                                  size: 40,
                                  color: getColorSocialMedia(
                                      socialMedia_: "facebook"),
                                ),
                                onPressed: () {
                                  if ((snapshot.data["facebook"] != null) &&
                                      (snapshot.data["facebook"] != "")) {
                                    launch(snapshot.data["facebook"]);
                                  } else {
                                    launch("https://facebook.com/" +
                                        _getNameSocialMedia(
                                            snapshot.data["name"].toString()));
                                  }
                                }),
                            IconButton(
                                icon: new Icon(
                                  FontAwesomeIcons.instagram,
                                  size: 40,
                                  color: getColorSocialMedia(
                                      socialMedia_: "instagram"),
                                ),
                                onPressed: () {
                                  if ((snapshot.data["instagram"] != null) &&
                                      (snapshot.data["instagram"] != "")) {
                                    launch(snapshot.data["instagram"]);
                                  } else {
                                    launch("https://instagram.com/" +
                                        _getNameSocialMedia(
                                            snapshot.data["name"].toString()));
                                  }
                                }),
                            IconButton(
                                icon: new Icon(
                                  FontAwesomeIcons.twitter,
                                  size: 40,
                                  color: getColorSocialMedia(
                                      socialMedia_: "twitter"),
                                ),
                                onPressed: () {
                                  if ((snapshot.data["twitter"] != null) &&
                                      (snapshot.data["twitter"] != "")) {
                                    launch(snapshot.data["twitter"]);
                                  } else {
                                    launch("https://twitter.com/" +
                                        _getNameSocialMedia(
                                            snapshot.data["name"].toString()));
                                  }
                                }),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.blueAccent,
                          size: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                              snapshot.data["endereco"].toString() ?? "",
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: Center(
                              child: Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (snapshot.data["maps"] == null
                                          ? AssetImage("images/maps.png")
                                          : CachedNetworkImageProvider(
                                              snapshot.data["maps"])),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            onTap: () {
                              launch(
                                  "https://www.google.com/maps/search/?api=1&query=${snapshot.data["lat"]},"
                                  "${snapshot.data["long"]}");
                            },
                          )
                        ],
                      ),
                    ),
                  ]);
                }
              })),
    );
  }
}

Color getColorSocialMedia({@required String socialMedia_}) {
  switch (socialMedia_) {
    case "facebook":
      return Color(0xff1877f2);
      break;
    case "instagram":
      return Color(0xffC13584);
      break;
    case "twitter":
      return Color(0xff1da1f2);
      break;
    case "youtube":
      return Color(0xffff0000);
      break;
    case "linkedin":
      return Color(0xff007bb5);
      break;
    case "link":
      return Color(0xffa6b1b7);
      break;
    case "extra":
      return Color(0xff35465d);
      break;
    default:
      return Color(0xff000000);
      break;
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

class InverseShapesPainter extends CustomPainter {
  final BuildContext context;

  InverseShapesPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint redPaint = Paint()..color = Colors.white;

    // This will produce a circle as the rectangle is a square.
    canvas.drawOval(
        Rect.fromPoints(
          Offset(8, -250),
          Offset(405, 250),
        ),
        redPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
