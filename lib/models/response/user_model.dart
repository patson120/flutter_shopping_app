

import 'dart:convert';

class User{

  User({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image
    });

  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  factory User.fromJson(String string) => User.fromMap(json.decode(string));

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json['id'] ?? 0,
    username: json['username'] ?? "",
    email: json['email'] ?? "",
    firstName: json['firstName'] ?? "",
    lastName: json['lastName'] ?? "",
    gender: json['gender'] ?? "",
    image: json['image'] ?? "",
  );

  Map<String, dynamic> toMap() => {
    'id': id ?? "",
    'username': username ?? "",
    'email': email ?? "",
    'firstName': firstName ?? "",
    'lastName': lastName ?? "",
    'gender': gender ?? "",
    'image': image ?? "",
  };
  
  String toJson() => json.encode(toMap());
}