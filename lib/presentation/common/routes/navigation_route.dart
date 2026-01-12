import 'package:flutter/material.dart';
import 'package:kanban_app/presentation/common/constants/route_constant.dart';
import 'package:kanban_app/presentation/screen/dashboard/dashboard_view.dart';
import 'package:kanban_app/presentation/screen/splash/splash_view.dart';

class GeneratedRoute {
  Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteConstant.splash:
        return generateRoute(const SplashView());
      case RouteConstant.dashboard:
        return generateRoute(const DashboardView());
      default:
        return generateRoute(const DashboardView());
    }
  }

  PageRouteBuilder generateRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
