// To parse this JSON data, do
//
//     final chatResponse = chatResponseFromJson(jsonString);

import 'dart:convert';

ChatResponse chatResponseFromJson(String str) =>
    ChatResponse.fromJson(json.decode(str));

String chatResponseToJson(ChatResponse data) => json.encode(data.toJson());

class ChatResponse {
  String id;
  String name;
  String email;
  String pic;
  String school;
  String token;

  ChatResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.pic,
    required this.school,
    required this.token,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) => ChatResponse(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        pic: json["pic"],
        school: json["school"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "pic": pic,
        "school": school,
        "token": token,
      };
}
