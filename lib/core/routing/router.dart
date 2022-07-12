import 'package:ecommerce_ui/core/routing/routes.dart';
import 'package:ecommerce_ui/ui/home_view.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'No Page Found',
                ),
              ),
            );
          },
        );
    }
  }
}
