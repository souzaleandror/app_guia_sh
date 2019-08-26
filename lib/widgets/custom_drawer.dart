import 'package:app_guia_sh/screens/login_screen.dart';
import 'package:app_guia_sh/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 16.0, top: 16.0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                height: 120.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Guia \nSanta Helena - PR",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
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
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            child: Text(
                              "Entre ou cadastre-se ->",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ]),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.favorite, "Meus Favoritos", pageController, 0),
              Divider(),
              DrawerTile(Icons.new_releases, "Destaques", pageController, 0),
              Divider(),
              DrawerTile(FontAwesomeIcons.bell, "Eventos / Festivais",
                  pageController, 0),
              Divider(),
              DrawerTile(Icons.record_voice_over, "Contato", pageController, 0),
              Divider(),
              DrawerTile(Icons.poll, "Avaliar", pageController, 0),
              Divider(),
            ],
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.all(10),
            child: InkWell(
              child: Icon(
                FontAwesomeIcons.cogs,
                color: Colors.orange,
                size: 25,
              ),
              onTap: () {},
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 12, right: 20),
            child: Text(
              "Copyright © Guia66",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ]),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(right: 30),
            child: InkWell(
              child: Icon(
                Icons.help_outline,
                color: Colors.orange,
                size: 25,
              ),
              onTap: () {},
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(10),
            child: InkWell(
              child: Icon(
                Icons.info,
                color: Colors.orange,
                size: 25,
              ),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
