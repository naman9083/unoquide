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

Future<void> removeTokenFromGlobal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  await prefs.remove('student');
  await prefs.remove('email');
}

Future<void> putParentTokenToGlobal(String? token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token!);
}

Future<String> getParentTokenFromGlobal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token;
  if (prefs.containsKey('token')) {
    token = prefs.getString('token')!;
  }
  token ??= '';
  return token;
}

Future<void> removeParentTokenFromGlobal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
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

// put email to local storage
Future<void> putEmailToGlobal({String? email}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  print("Received email: $email");
  await prefs.setString('email', email!);
}

Future<String> getEmailFromGlobal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email;
  if (prefs.containsKey('email')) {
    email = prefs.getString('email')!;
  }
  email ??= '';
  return email;
}
