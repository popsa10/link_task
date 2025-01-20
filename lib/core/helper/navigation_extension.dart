

import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> replaceWith(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  void pop([dynamic result]) {
    Navigator.pop(this,result);
  }
}