import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String token;
  final String id;


  LoginModel({
    required this.token,
    required this.id
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"],
    id: json["id"]

  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "id": id

  };
}