import 'package:flutter/material.dart';
import 'package:multilangauge_app/pages/about_page.dart';
import 'package:multilangauge_app/pages/home_page.dart';
import 'package:multilangauge_app/pages/not_found_page.dart';
import 'package:multilangauge_app/pages/setting_page.dart';
import 'package:multilangauge_app/routes/route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingPage());
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
