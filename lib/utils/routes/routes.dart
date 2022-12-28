import 'package:flutter/material.dart';
import 'package:unoquide/utils/routes/route_names.dart';
import 'package:unoquide/views/screens/home/homepage.dart';

import '../../views/screens/authentication/login.dart';
import '../../views/screens/errorScreens/error_screen.dart';
import '../../views/screens/splash/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case RouteNames.errorScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ErrorScreen());

      case RouteNames.loginScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RouteNames.homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ErrorScreen());
    }
  }
}
