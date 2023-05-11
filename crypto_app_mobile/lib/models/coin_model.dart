import 'dart:convert';

CoinModel coinModelFromJson(String str) => CoinModel.fromJson(json.decode(str));

String coinModelToJson(CoinModel data) => json.encode(data.toJson());

class CoinModel {
  CoinModel(
      {required this.name,
      required this.balance,
      required this.symbol,
      required this.image,
      required this.id,
      required this.qr_code,
      required this.address,
      this.current_price,
      this.amount}) {
    //current_price = "0.00";
  }

  String name;
  int balance;
  String symbol;
  String image;
  String qr_code;
  int id;
  String address;
  String? current_price = "";
  String? amount;

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
      name: json["name"],
      balance: json["balance"],
      symbol: json["symbol"],
      image: json["image"],
      qr_code: json['qr_code'],
      id: json['id'],
      address: json['address'],
      current_price: json['current_price'] ?? "Loading....",
      amount: json['amount'] ?? "Loading....");

  Map<String, dynamic> toJson() => {
        "name": name,
        "balance": balance,
        "symbol": symbol,
        "image": image,
        "id": id,
        "qr_code": qr_code,
        "address": address
      };
}
