import 'dart:math';

import 'package:app_guia_sh/screens/company_screen.dart';
import 'package:app_guia_sh/screens/home_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyFavoritesTab extends StatelessWidget {
  var _pageController = PageController();

  MyFavoritesTab(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(_pageController),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        title: Text("Meus Favorites",
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
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection("categories")
              .document("1M5ffsCilsDLNlzgUv6u")
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

  Widget _contactCard(BuildContext context, DocumentSnapshot company) {
    final Random rnd = Random();
    final int min = 1;
    final int max = 5;
    final int kmin = 1;
    final int kmax = 40;
    var num = min + rnd.nextInt(max - min);
    num = 4;
    var knum = kmin + rnd.nextInt(kmax - kmin);

    Color _getColorKm(int km) {
      if (km <= 10) {
        return Colors.green;
      } else if (km >= 10 && km <= 25) {
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
                    width: MediaQuery.of(context).size.width * 0.52,
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
                    Material(
                      child: SizedBox(
                          width: 45,
                          height: 45,
                          child: Icon(
                            Icons.favorite,
                            size: 45,
                            color: Colors.red,
                          )),
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
            builder: (context) =>
                CompanyScreen(company, "1M5ffsCilsDLNlzgUv6u")));
      },
    );
  }
}
