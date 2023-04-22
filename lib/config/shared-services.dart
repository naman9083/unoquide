import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:unoquide/models/studentModel.dart';

Future<void> putTokenToGlobal({String? token}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token!);
}

Future<String> getTokenFromGlobal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token;
  if (prefs.containsKey('token')) {
    token = prefs.getString('token')!;
  }
  token ??= '';
  return token;
}

Future<void> putStudentToGlobal({Student? student}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('student', jsonEncode(student));
}

Future<Student> getStudentFromGlobal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Student? student;
  if (prefs.containsKey('student')) {
    student = Student.fromJson(jsonDecode(prefs.getString('student')!));
  }
  return student!;
}
