import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.name,
    required this.amount,
    required this.symbol,
    required this.type,
    required this.status,
    required this.date,
  });

  String name;
  int amount;
  String symbol;
  String type;
  String status;
  String date;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        name: json["name"],
        amount: json["amount"],
        symbol: json["symbol"],
        type: json["type"],
        status: json["status"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "symbol": symbol,
        "type": type,
        "status": status,
        "date": date,
      };
}
