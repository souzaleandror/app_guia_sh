import 'package:app_guia_sh/tabs/home_tab.dart';
import 'package:app_guia_sh/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(_pageController),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
