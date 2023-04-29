import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/studentModel.dart';

Future<Student> getStudentData(String authToken) async {
  String url = "$baseURL/student/";
  Uri uri = Uri.parse(url);
  var response = await http.get(uri, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $authToken',
  });
  if (response.statusCode == 200) {
    return Student.fromJson(jsonDecode(response.body));
    print(response.body);
  } else {
    throw Exception('Failed to create post');
  }
}
