import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
    required this.color,
  });

  int userId;
  int id;
  String title;
  String? body;
  Color color;

  factory Post.fromJson(Map<String, dynamic> json) {
    List<Color> avatarColors = [
      Colors.red,
      const Color.fromARGB(255, 48, 117, 50),
      Colors.brown,
      Colors.black,
      const Color.fromARGB(255, 133, 122, 27),
      Colors.orange,
      Colors.blue
    ];
    return Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
      color: avatarColors[Random().nextInt(avatarColors.length)],
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
        "color": color,
      };
}
