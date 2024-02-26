// To parse this JSON data, do
//
//     final dummyJsonUserModel = dummyJsonUserModelFromJson(jsonString);

import 'dart:convert';

DummyJsonUserModel dummyJsonUserModelFromJson(String str) => DummyJsonUserModel.fromJson(json.decode(str));

String dummyJsonUserModelToJson(DummyJsonUserModel data) => json.encode(data.toJson());

class DummyJsonUserModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;

  DummyJsonUserModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
  });

  factory DummyJsonUserModel.fromJson(Map<String, dynamic> json) => DummyJsonUserModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "image": image,
    "token": token,
  };
}
