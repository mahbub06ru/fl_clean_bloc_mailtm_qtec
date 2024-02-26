// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

AccountModel accountModelFromJson(String str) => AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  final String id;
  final String address;

  AccountModel({
    required this.id,
    required this.address,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    id: json["id"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
  };
}
