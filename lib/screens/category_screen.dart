import 'package:app_guia_sh/screens/company_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: true,
        title: Text(snapshot["nome"]),
        centerTitle: true,
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

  Widget _contactCard(BuildContext context, DocumentSnapshot company) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(company["nome"] ?? "",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold)),
                      Text(company["telefone"] ?? "",
                          style: TextStyle(fontSize: 12.0)),
                      Text(company["endereco"] ?? "",
                          style: TextStyle(fontSize: 12.0)),
                    ],
                  ))
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CompanyScreen(company)));
      },
    );
  }
}
