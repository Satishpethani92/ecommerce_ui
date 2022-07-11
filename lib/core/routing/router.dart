import 'package:ecommers_ui/core/routing/routes.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.masterPasswordLogin:
        return MaterialPageRoute(builder: (context) => const MasterPasswordLoginView());
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
