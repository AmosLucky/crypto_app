import 'dart:convert';

import 'package:crypto_app_mobile/constants/api_uri.dart';
import 'package:crypto_app_mobile/models/coin_model.dart';
import 'package:crypto_app_mobile/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class TransactionRepo extends ChangeNotifier {
  String _loginMsg = "";
  String _msg = "";
  bool _isLoding = false;
  String get loginMsg => _loginMsg;
  bool get isLoding => _isLoding;
  String get msg => _msg;

  Future getUserTransactions(var userId, var coinId) async {
    try {
      Response response = await http.post(Uri.parse(getUserTransactionsUrl),
          body: coinId == ""
              ? {"user_id": userId.toString()}
              : {"user_id": userId.toString(), "coin_id": coinId.toString()});
      dynamic result = jsonDecode(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(result);
        if (result['status']) {
          return result['data'];
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> sendCoin(
      {var userPin,
      var pin,
      var user_id,
      var amount,
      var address,
      CoinModel? coinModel}) async {
    _isLoding = true;
    _msg = "";
    notifyListeners();

    if (pin != userPin) {
      _isLoding = false;
      _msg = "Incorrect transaction pin";
      notifyListeners();
      return false;
    }
    try {
      Response response = await http.post(Uri.parse(send_coin), body: {
        "user_id": user_id.toString(),
        "amount": amount.toString(),
        "address": address,
        "coin_id": coinModel!.id.toString(),
        "type": "debit"
      });
      dynamic result = jsonDecode(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        if (result['status']) {
          print(result);
          _msg = result['msg'];
          _isLoding = false;
          notifyListeners();

          return result['status'];
        } else {
          _msg = result['msg'];
          _isLoding = false;
          notifyListeners();
          return result['status'];
        }

        /// GeneralRepo().navigateToScreen2(HomeScreen());
        // isSuccessful = true;
        // if (result["status"] == true) {
        //   UserModel userModel = UserModel.fromJson(result["data"]);
        //   currentUser = userModel;
        //   _userModel = userModel;
        //   notifyListeners();
        // }
      } else {
        _msg = "An error occoured";
        _isLoding = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _msg = e.toString();
      _isLoding = false;
      notifyListeners();
      return false;
    }
  }
}
