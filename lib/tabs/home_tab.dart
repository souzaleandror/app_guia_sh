import 'package:app_guia_sh/screens/category_screen.dart';
import 'package:app_guia_sh/widgets/custom_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  var _pageController = PageController();

  HomeTab(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(_pageController),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
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
                        width: MediaQuery.of(context).size.width,
                        color: Colors.orange,
                        child: Text(
                          "Bem Vindo a",
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
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 1
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          color: Colors.orange,
                        ),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Santa Helena - Parana",
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
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //ROW 1
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          color: Colors.orange,
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 15, top: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            "Encontramos ${snapshot.data.documents.length.toString()} categorias para você",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
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
                  FutureBuilder<QuerySnapshot>(
                      future: Firestore.instance
                          .collection("promover")
                          .getDocuments(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container(
                            height: 200.0,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          );
                        } else {
                          return Row(
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
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 0.8,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      pauseAutoPlayOnTouch:
                                          Duration(seconds: 10),
                                      items: snapshot.data.documents.map((url) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                1.0)),
                                                    color: Colors.grey[100],
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black,
                                                        blurRadius: 0.5,
                                                        spreadRadius: 0.5,
                                                      ),
                                                    ]),
                                                child: CachedNetworkImage(
                                                  placeholderFadeInDuration:
                                                      Duration(seconds: 10),
                                                  fadeOutDuration:
                                                      Duration(seconds: 1),
                                                  fadeInDuration:
                                                      Duration(seconds: 1),
                                                  imageUrl: url["image"],
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
                          );
                        }
                      }),
                  Row(
                    //ROW 1
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Text("Categorias",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                                color: Colors.orange,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0.5, 0.5),
                                    blurRadius: 0.5,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 10, right: 10),
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
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  30) /
                                              2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                const Radius.circular(20.0),
                                            bottomRight:
                                                const Radius.circular(20.0)),
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.80),
                                      ),
                                      child: Text(
                                          snapshot.data.documents[index]
                                              ["nome"],
                                          style: TextStyle(
                                              fontSize: 21.0,
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
