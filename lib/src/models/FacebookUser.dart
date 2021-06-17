import 'package:flutter/material.dart';

class FacebookUser {
  String name;
  String email;
  String id;
  String pictureUrl;
  FacebookUser({
    @required this.name,
    @required this.email,
    @required this.id,
    @required this.pictureUrl,
  });

  factory FacebookUser.fromJson(Map<String, dynamic> parsedJson) {
    return FacebookUser(
      name: parsedJson['name'],
      email: parsedJson['email'],
      id: parsedJson['id'],
      pictureUrl: parsedJson['picture']['data']['url'],
    );
  }
}
