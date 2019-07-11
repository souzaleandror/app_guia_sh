import 'package:app_guia_sh/screens/category_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: false,
        title: Text("Categorias"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("categories").getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                padding: EdgeInsets.all(4.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  childAspectRatio: 0.65,
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
                          AspectRatio(
                            aspectRatio: 0.8,
                            child: CachedNetworkImage(
                                placeholder: CircularProgressIndicator(),
                                errorWidget: Icon(Icons.error),
                                fadeOutDuration: Duration(seconds: 1),
                                fadeInDuration: Duration(seconds: 2),
                                imageUrl: snapshot.data.documents[index]
                                    ["images"],
                                fit: BoxFit.cover),
                            //child: Image.network(
                            //    snapshot.data.documents[index]["images"],
                            //    fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(snapshot.data.documents[index]["nome"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ));
                },
              );
            }
          }),
    );
  }
}
