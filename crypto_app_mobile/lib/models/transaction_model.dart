// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    required this.name,
    required this.amount,
    required this.symbol,
    required this.type,
    required this.status,
    required this.date,
  });

  String name;
  // int user_id;
  // int coin_id;
  var amount;
  String symbol;
  String type;
  String status;
  String date;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        name: json["name"] ?? "",
        amount: json["amount"] ?? "",
        symbol: json["symbol"] ?? "",
        type: json["type"] ?? "",
        status: json["status"] ?? "",
        date: json["created_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "symbol": symbol,
        "type": type,
        "status": status,
        "created_at": date,
      };
}
