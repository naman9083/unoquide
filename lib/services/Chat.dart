import 'dart:convert';

import 'package:unoquide/constants/constants.dart';

import '../models/chatModel.dart';
import 'package:http/http.dart' as http;

Future<ChatResponse> chatResponse(String email) async {
  Uri uri = Uri.parse('$baseURL/api/user/login');
  var res = await http.post(uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email}));
  //
  if (res.statusCode == 200) {
    print("Fetched Data successfully");
    return chatResponseFromJson(res.body);
  } else {
    throw Exception('Failed to create post');
  }
}
