import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class NavigationRoute {
  final Logger logger;
  const NavigationRoute(this.logger);
  Future<dynamic> push(BuildContext context, String routeName, {dynamic args}) {
    logger.d('push to $routeName');
    return Navigator.pushNamed(context, routeName, arguments: args);
  }

  Future<dynamic> pushReplace(
    BuildContext context,
    String routeName, {
    dynamic args,
  }) {
    logger.d('pushReplace to $routeName');
    return Navigator.pushReplacementNamed(context, routeName, arguments: args);
  }

  void pop(
    BuildContext context, {
    dynamic args,
    required String previousScreen,
  }) {
    logger.d('pop from $previousScreen');
    return Navigator.pop(context, args);
  }

  void popUntil(BuildContext context) {
    logger.d('pop');
    return Navigator.popUntil(context, (Route route) => route.isFirst);
  }

  void popAllAndPush(
    BuildContext context,
    String routeName, {
    dynamic args,
    bool isGoToFirstRoute = false,
  }) {
    logger.d('popAllAndPush to $routeName');

    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (Route route) => (route.isFirst && isGoToFirstRoute),
      arguments: args,
    );
  }
}
