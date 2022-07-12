import 'package:ecommerce_ui/core/routing/locator.dart';
import 'package:ecommerce_ui/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'core/routing/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeView,
        onGenerateRoute: PageRouter.generateRoute,

      );
    },)
  );
}