import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:cuzdan/core/constant/navigation/navigation_constants.dart';
import 'package:cuzdan/ui/home/home_view.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(HomeView());
      default:
        return normalNavigate(const Scaffold());
    }
  }

  PageRoute normalNavigate(Widget widget) {
    return Platform.isAndroid ? MaterialPageRoute(builder: (context) => widget) : CupertinoPageRoute(builder: (context) => widget);
  }

  PageRoute normalNavigateToPop(Widget widget) {
    return Platform.isAndroid ? MaterialPageRoute(builder: (context) => widget) : CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true);
  }
}
