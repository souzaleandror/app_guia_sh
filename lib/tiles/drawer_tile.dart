import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: (page != -1
                ? () {
                    Navigator.of(context).pop();
                    controller.jumpToPage(page);
                  }
                : () {
                    if (Platform.isAndroid) {
                      launch("https://play.google.com/store");
                    } else {
                      launch("https://www.apple.com/ios/app-store/");
                    }
                  }),
            child: Container(
              height: 60.0,
              child: Row(
                children: <Widget>[
                  Icon(
                    icon,
                    size: 32.0,
                    color: controller.page.round() == page
                        ? Color(0xffffffff)
                        : Colors.white,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w700,
                        color: controller.page.round() == page
                            ? Color(0xffffffff)
                            : Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: controller.page.round() == page
                                ? Color.fromARGB(255, 0, 0, 0)
                                : Color.fromARGB(255, 0, 0, 0),
                          ),
                        ]),
                  ),
                ],
              ),
            )));
  }
}
