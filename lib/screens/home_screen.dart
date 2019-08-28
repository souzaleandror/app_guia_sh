import 'package:app_guia_sh/tabs/contact_tab.dart';
import 'package:app_guia_sh/tabs/events_festivals_tab.dart';
import 'package:app_guia_sh/tabs/highlights_tab.dart';
import 'package:app_guia_sh/tabs/home_tab.dart';
import 'package:app_guia_sh/tabs/my_favorites_tab.dart';
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
        Scaffold(
          body: MyFavoritesTab(_pageController),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: HighlightsTab(_pageController),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: EventsFestivalsTab(_pageController),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: ContactTab(_pageController),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
