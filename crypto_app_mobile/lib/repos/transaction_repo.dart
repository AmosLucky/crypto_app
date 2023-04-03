import 'package:crypto_app_mobile/constants/api_uri.dart';
import 'package:flutter/material.dart';

class TransactionRepo extends ChangeNotifier {
  Future<List<Map<String, dynamic>>> getUserTransactions(var coinId) async {
    return Future.delayed(Duration(seconds: 3), () {
      return transactions;
    });
  }
}
