// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

import 'package:crypto_app_mobile/repos/account_manager.dart';

UserModel usersFromJson(String str) => UserModel.fromJson(json.decode(str));

String usersToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  dynamic name;
  dynamic username;
  dynamic email;
  dynamic access;
  dynamic status;
  dynamic updatedAt;
  dynamic createdAt;
  dynamic id;
  dynamic token = " ";
  dynamic phone = "";
  dynamic balance;
  dynamic email_verified_at = "";
  dynamic remeber_token = "";
  dynamic transaction_pin = "";
  var coins = [];
  UserModel(
      {this.name,
      this.username,
      this.email,
      this.access,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.token,
      this.phone,
      this.balance,
      this.status,
      required this.coins,
      this.email_verified_at,
      required this.remeber_token,
      this.transaction_pin}) {}

  // factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  //     fullname: json["username"] ?? "",
  //     access: json["access"] ?? "",
  //     token: json["token"] ?? "",
  //     balance: json['wallet']["balance"],
  //     email: json["user"]["email"] ?? "",
  //     name: json["user"]["name"] ?? "",
  //     updatedAt: (json["user"]["updated_at"] ?? ""),
  //     createdAt: (json["user"]["created_at"] ?? ""),
  //     id: json["user"]["id"],
  //     phone: "");

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      username: json["username"] ?? "",
      access: json["access"] ?? "",
      //token: json["token"] ?? "",
      email: json["email"] ?? "",
      name: json["name"] ?? "",
      balance: json["balance"] ?? "",
      updatedAt: (json["updated_at"] ?? ""),
      createdAt: (json["created_at"] ?? ""),
      id: json["id"] ?? "",
      phone: json["phone"] ?? "",
      status: json["status"] ?? "",
      coins: json["coins"] ?? [],
      email_verified_at: json['email_verified_at'] ?? "",
      remeber_token: json['remeber_token'] ?? "",
      transaction_pin: json['transaction_pin'] ?? "");

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "access": access,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
        "token": token,
        "phone": phone,
        "coins": coins,
        "status": status,
        "email_verified_at": email_verified_at,
        "remeber_token": remeber_token,
        "transaction_pin": transaction_pin
      };
}
