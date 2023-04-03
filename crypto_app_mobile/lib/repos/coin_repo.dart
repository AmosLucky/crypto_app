import 'package:flutter/material.dart';

class CoinRepo extends ChangeNotifier {
  bool validWalletAddress(String? text) {
    return text!.trim().length > 10;
  }
}
