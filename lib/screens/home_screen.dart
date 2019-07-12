import 'dart:io' show Platform;

import 'package:app_guia_sh/screens/category_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("categories").getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(children: <Widget>[
                  Row(
                    //ROW 1
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.only(top: Platform.isAndroid ? 30 : 45),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.orange,
                        child: Text(
                          "Bem Vindo a",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45.0,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 1
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.orange,
                        child: Text(
                          "Santa Helena - Parana",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 1
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.orange,
                        child: Text("Encontramos 30 categorias para você",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 1
                    children: [
                      Container(
                        //padding: EdgeInsets.only(top: 10, bottom: 10),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        //color: Colors.orange,
                        child: CustomPaint(
                            painter: ShapesPainter(),
                            child: CarouselSlider(
                              height: 300.0,
                              items: imgList.map((url) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1.0)),
                                            color: Colors.grey[100],
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 0.5,
                                                spreadRadius: 0.5,
                                              ),
                                            ]),
                                        child: CachedNetworkImage(
                                          placeholder:
                                              CircularProgressIndicator(),
                                          errorWidget: Icon(Icons.error),
                                          fadeOutDuration: Duration(seconds: 1),
                                          fadeInDuration: Duration(seconds: 2),
                                          imageUrl: url,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 1
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Text("Categorias",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                                color: Colors.orange,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 255, 255, 0),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.30,
                    ),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                    snapshot.data.documents[index])));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0.5))),
                                      child: AspectRatio(
                                        aspectRatio: 1.5,
                                        child: CachedNetworkImage(
                                            placeholder:
                                                CircularProgressIndicator(),
                                            errorWidget: Icon(Icons.error),
                                            fadeOutDuration:
                                                Duration(seconds: 1),
                                            fadeInDuration:
                                                Duration(seconds: 2),
                                            imageUrl: snapshot.data
                                                .documents[index]["images"],
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  //How to set background to Text ?
                                  //Let's move Text inside a Container,then set it's decoration
                                  Container(
                                    margin: EdgeInsets.only(top: 105),
                                    alignment: Alignment.center,
                                    constraints: const BoxConstraints(
                                        minWidth: double.infinity),
                                    decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.only(
                                          bottomLeft:
                                              const Radius.circular(20.0),
                                          bottomRight:
                                              const Radius.circular(20.0)),
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.75),
                                    ),
                                    child: Text(
                                        snapshot.data.documents[index]["nome"],
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: Offset(1.0, 1.0),
                                                blurRadius: 3.0,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 1),
                                              ),
                                            ])),
                                  ),
                                ],
                              ),
                            ],
                          ));
                    },
                  ),
                ]),
              );
            }
          }),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // set the paint color to be white
    paint.color = Colors.white;

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);

    paint.color = Colors.orange;

    // create a path
    var path = Path();
    path.lineTo(0, size.height + 50);
    path.lineTo(size.width + 10, 0);
    // close the path to form a bounded shape
    path.close();

    canvas.drawPath(path, paint);

    // set the color property of the paint
    paint.color = Colors.deepOrange;

    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);

    // draw the circle with center having radius 75.0
    //canvas.drawCircle(center, 75.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
