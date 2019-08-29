import 'dart:math';

import 'package:app_guia_sh/screens/company_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: true,
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon((snapshot["nome"] != null && snapshot["nome"] != ""
                ? _getIconDataAppBar(snapshot["nome"].toString().toLowerCase())
                : null)),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection("categories")
              .document(snapshot.documentID)
              .collection("empresa")
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  padding: EdgeInsets.all(4.0),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot company = snapshot.data.documents[index];

                    return _contactCard(context, company);
                  });
            }
          }),
    );
  }

  IconData _getIconDataAppBar(String icon) {
    if (icon != null && icon != "") {
      switch (icon) {
        case "lanchonete":
          return FontAwesomeIcons.hotdog;
          break;
        case "academia":
          return FontAwesomeIcons.weight;
          break;
        case "hotel":
          return FontAwesomeIcons.hotel;
          break;
        case "informática":
          return FontAwesomeIcons.desktop;
          break;
        case "roupas":
          return FontAwesomeIcons.tshirt;
          break;
        case "moveis":
          return FontAwesomeIcons.couch;
          break;
        case "mecânico":
          return FontAwesomeIcons.screwdriver;
          break;
        case "restaurantes":
          return FontAwesomeIcons.utensils;
          break;
        case "advocacia":
          return FontAwesomeIcons.userTie;
          break;
        case "concessionária":
          return FontAwesomeIcons.carAlt;
          break;
        default:
          return FontAwesomeIcons.star;
          break;
      }
    } else {
      return FontAwesomeIcons.star;
    }
  }

  Widget _contactCard(BuildContext context, DocumentSnapshot company) {
    final Random rnd = Random();
    final int min = 1;
    final int max = 5;
    final int kmin = 0;
    final int kmax = 25;
    var num = min + rnd.nextInt(max - min);
    num = 4;
    var knum = kmin + rnd.nextInt(kmax - kmin);

    Color _getColorKm(int km) {
      if (km < 5) {
        return Colors.green;
      } else if (km >= 5 && km <= 15) {
        return Colors.amber;
      } else {
        return Colors.red;
      }
    }

    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(company["images"]),
                      fit: BoxFit.cover),
                ),
              ), // Container
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.yellow,
                            ),
                            Icon(
                              (num >= 2 ? Icons.star : Icons.star_border),
                              size: 20,
                              color: Colors.yellow,
                            ),
                            Icon(
                              (num >= 3 ? Icons.star : Icons.star_border),
                              size: 20,
                              color: Colors.yellow,
                            ),
                            Icon(
                              (num >= 4 ? Icons.star : Icons.star_border),
                              size: 20,
                              color: Colors.yellow,
                            ),
                            Icon(
                              (num == 5 ? Icons.star : Icons.star_border),
                              size: 20,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                        Text(company["nome"] ?? "",
                            style: TextStyle(
                                fontSize:
                                    ((MediaQuery.of(context).orientation ==
                                                Orientation.portrait) &&
                                            company["nome"].length >= 26)
                                        ? 16.0
                                        : 20,
                                fontWeight: FontWeight.bold)),
                        Text(company["endereco"] ?? "",
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, right: 7),
                              child: Text(company["telefone"] ?? "",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                              size: 16.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.white, // button color
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.location_on,
                              size: 35,
                              color: Colors.orange,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "${knum} Km",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _getColorKm(knum),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CompanyScreen(company, snapshot.documentID)));
      },
    );
  }
}
