import 'package:flutter/material.dart';

class NavigationConfig {
  static final NavigationConfig _singleton = NavigationConfig._internal();

  factory NavigationConfig() {
    return _singleton;
  }

  NavigationConfig._internal();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static var currentState = navigatorKey.currentState;
}
