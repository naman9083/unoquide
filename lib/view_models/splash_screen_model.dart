import 'package:flutter/material.dart';
import 'package:unoquide/config/shared-services.dart';
import 'package:unoquide/services/studentData.dart';

import '../utils/routes/route_names.dart';

class MyCustomClass {
  const MyCustomClass();

  Future<void> myAsyncMethod(
      BuildContext context, VoidCallback onSuccess) async {
    await Future.delayed(const Duration(seconds: 2));
    onSuccess.call();
  }
}

class SplashScreenModel {
  initiateApp(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    getTokenFromGlobal().then((value) {
      if (value != '') {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.homeScreen, (route) => false);
        // getStudentData(value).then((value) {
        //   putStudentToGlobal(student: value);
        //
        //   print(value.firstName);
        //   // print(value);
        // });
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.categoryLoginScreen, (route) => false);
      }
    });
  }
}
