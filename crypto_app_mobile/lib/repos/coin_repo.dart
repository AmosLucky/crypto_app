import 'package:flutter/material.dart';

class CoinRepo extends ChangeNotifier {
  String _keyword = "";
  String get keyword => _keyword;
  bool validWalletAddress(String? text) {
    return text!.trim().length > 10;
  }

  setKeyWord(String? text) {
    _keyword = text!;
    notifyListeners();
  }
}
