import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static GlobalKey<NavigatorState> navigatorStateKey = GlobalKey<NavigatorState>();

  static void backTo(RoutePredicate predicate) =>
      navigatorStateKey.currentState!.popUntil(predicate);

  static void pop<T extends Object>([T? result]) => navigatorStateKey.currentState!.pop(result);

  static Future<T?> push<T>(Route<T> route) => navigatorStateKey.currentState!.push(route);

  static Future<T?> pushReplacement<T extends Object, TO extends Object>(
    Route<T> newRoute, {
    TO? result,
  }) =>
      navigatorStateKey.currentState!.pushReplacement(newRoute, result: result);

  static Future<T?> pushAndRemoveUntil<T extends Object>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) =>
      navigatorStateKey.currentState!.pushAndRemoveUntil(newRoute, predicate);

  static Future<T?> pushAlone<T extends Object>(Route<T> newRoute) =>
      navigatorStateKey.currentState!.pushAndRemoveUntil(newRoute, (route) => false);
}
