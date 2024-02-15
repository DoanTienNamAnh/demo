import 'package:demo/home.dart';
import 'package:demo/profile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.profile:
        return _materialRoute(RouteName.profile, ProfilePage(key: UniqueKey()));
      case RouteName.home:
        return _materialRoute(RouteName.home, HomePage(key: UniqueKey()));
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(String routeName, Widget view) {
    return PageTransition(
        child: view,
        type: PageTransitionType.fade,
        alignment: Alignment.center,
        settings: RouteSettings(name: routeName));
  }
}

class RouteName {
  static const String home = "/";
  static const String login = "/login";
  static const String main = "/main";
  static const String profile = "/profile";

}
