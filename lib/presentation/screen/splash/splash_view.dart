import 'package:flutter/material.dart';
import 'package:kanban_app/di/injection.dart';
import 'package:kanban_app/presentation/common/constants/route_constant.dart';
import 'package:kanban_app/presentation/common/routes/generated_route.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToDashboardView();
  }

  Future<void> navigateToDashboardView() async {
    await Future.delayed(const Duration(seconds: 2));
    getIt<NavigationRoute>().pushReplace(context, RouteConstant.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          // Icon Rlated Kanban App
          Icons.dashboard,
          size: 100,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
