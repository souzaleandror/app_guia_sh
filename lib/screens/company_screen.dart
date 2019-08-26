import 'dart:io' show Platform;
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyScreen extends StatefulWidget {
  final DocumentSnapshot snapshot;

  CompanyScreen(this.snapshot);

  @override
  _CompanyScreenState createState() => _CompanyScreenState(snapshot);
}

class _CompanyScreenState extends State<CompanyScreen> {
  final DocumentSnapshot snapshot;
  final Random rnd = Random();
  int min = 1;
  int max = 5;

  _CompanyScreenState(this.snapshot);

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  hexColor(String colorhexcode) {
    String colornew = "0xff" + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
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

  @override
  Widget build(BuildContext context) {
    var num = min + rnd.nextInt(max - min);
    _getCompanyIsOpen();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: (snapshot["color"] == null
              ? Colors.orange
              : Color(hexColor(snapshot["color"]))),
          elevation: 0,
          title: Text(snapshot["nome"],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ((MediaQuery.of(context).orientation ==
                              Orientation.portrait) &&
                          snapshot["nome"].length >= 15)
                      ? 22.0
                      : 30.0,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(
                          (rnd.nextBool() == true
                              ? Icons.favorite_border
                              : Icons.favorite),
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
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
                            image:
                                CachedNetworkImageProvider(snapshot["images"]),
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
                          ? "images/open2.png"
                          : "images/closed.png"),
                      width: 80,
                      height: 80,
                      color: (_getCompanyIsOpen() ? Colors.green : Colors.red),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot["nome"] ?? "",
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
                    Text(snapshot["slogan"] ?? "Venha nos conhecer !",
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
                    (num >= 2 ? Icons.star : Icons.star_border),
                    size: 60,
                    color: Colors.yellow,
                  ),
                  Icon(
                    (num >= 3 ? Icons.star : Icons.star_border),
                    size: 60,
                    color: Colors.yellow,
                  ),
                  Icon(
                    (num >= 4 ? Icons.star : Icons.star_border),
                    size: 60,
                    color: Colors.yellow,
                  ),
                  Icon(
                    (num == 5 ? Icons.star : Icons.star_border),
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
                          color:
                              _getCompanyIsOpen() ? Colors.green : Colors.red,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, top: 25),
                        child: Text(
                            snapshot["horario"] ?? "Abre 08:00h / Fecha 18:00h",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
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
                          color:
                              _getCompanyIsOpen() ? Colors.green : Colors.red,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, top: 25),
                        child: Text(snapshot["telefone"] ?? "",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 2, top: 10),
                          child: FlatButton(
                            child: Text(
                              (snapshot["telefone"] != "" ? "Ligar" : ""),
                              style: TextStyle(
                                  color: _getCompanyIsOpen()
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 18.0),
                            ),
                            onPressed: ((snapshot["telefone"] == "") ||
                                    (_getCompanyIsOpen()))
                                ? null
                                : () {
                                    launch("tel:${snapshot["telefone"]}");
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
                        child: Text(snapshot["telefone"] ?? "",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 2, top: 10),
                          child: FlatButton(
                            child: Text(
                              (snapshot["telefone"] != "" ? "Ligar" : ""),
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18.0),
                            ),
                            onPressed: snapshot["telefone"] == ""
                                ? null
                                : () {
                                    launch("tel:${snapshot["telefone"]}");
                                  },
                          )),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 48, top: 10),
                          child: FlatButton(
                            child: Text(
                              (snapshot["telefone"] != "" ? "Add / " : ""),
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18.0),
                            ),
                            onPressed: snapshot["telefone"] == ""
                                ? null
                                : () {
                                    launch("tel:${snapshot["telefone"]}");
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
                            color:
                                getColorSocialMedia(socialMedia_: "facebook"),
                          ),
                          onPressed: () {
                            if ((snapshot["facebook"] != null) &&
                                (snapshot["facebook"] != "")) {
                              launch(snapshot["facebook"]);
                            } else {
                              launch("https://facebook.com/" +
                                  _getNameSocialMedia(
                                      snapshot["nome"].toString()));
                            }
                          }),
                      IconButton(
                          icon: new Icon(
                            FontAwesomeIcons.instagram,
                            size: 40,
                            color:
                                getColorSocialMedia(socialMedia_: "instagram"),
                          ),
                          onPressed: () {
                            if ((snapshot["instagram"] != null) &&
                                (snapshot["instagram"] != "")) {
                              launch(snapshot["instagram"]);
                            } else {
                              launch("https://instagram.com/" +
                                  _getNameSocialMedia(
                                      snapshot["nome"].toString()));
                            }
                          }),
                      IconButton(
                          icon: new Icon(
                            FontAwesomeIcons.twitter,
                            size: 40,
                            color: getColorSocialMedia(socialMedia_: "twitter"),
                          ),
                          onPressed: () {
                            if ((snapshot["twitter"] != null) &&
                                (snapshot["twitter"] != "")) {
                              launch(snapshot["twitter"]);
                            } else {
                              launch("https://twitter.com/" +
                                  _getNameSocialMedia(
                                      snapshot["nome"].toString()));
                            }
                          }),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("          Nossos\nProdutos / Serviços",
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              CarouselSlider(
                height: 250.0,
                items: imgList.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.0)),
                              color: Colors.grey[100],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0.5,
                                  spreadRadius: 0.5,
                                ),
                              ]),
                          child: CachedNetworkImage(
                            placeholderFadeInDuration: Duration(seconds: 10),
                            fadeOutDuration: Duration(seconds: 1),
                            fadeInDuration: Duration(seconds: 1),
                            imageUrl: url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
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
                    child: Text(snapshot.data["endereco"].toString() ?? "",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20.0, color: Colors.black)),
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
                                image: (snapshot["maps"] == null
                                    ? AssetImage("images/maps.png")
                                    : CachedNetworkImageProvider(
                                        snapshot["maps"])),
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
            ],
          ),
        ));
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
