import 'dart:convert';
import 'package:shopping/models/response/user_model.dart';

class TokenReponseModel{

  TokenReponseModel({
    this.user,
    this.token,
    });

  final User? user;
  final String? token;

  factory TokenReponseModel.fromJson(String string) => TokenReponseModel.fromMap(json.decode(string));

  factory TokenReponseModel.fromMap(Map<String, dynamic> json) => TokenReponseModel(
    user: User.fromMap(json),
    token: json['token'] ?? "",
  );

  Map<String, dynamic> toMap() => {
    'user': user!.toMap(),
    'token': token ?? "",
  };
  
  String toJson() => json.encode(toMap());
}