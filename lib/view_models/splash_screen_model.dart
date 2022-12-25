import 'package:flutter/material.dart';
import 'package:unoquide/views/screens/home/homepage.dart';

import '../utils/routes/route_names.dart';

class SplashScreenModel {
  initiateApp(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2000));

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }
}
