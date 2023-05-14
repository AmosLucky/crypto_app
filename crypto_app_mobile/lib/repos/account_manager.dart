import 'dart:convert';
import 'dart:math';

import 'package:crypto_app_mobile/screens/reset_password.dart';
import 'package:crypto_app_mobile/screens/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/usermodel.dart';
import '../models/usermodel.dart';
import '../screens/add_transaction_pin.dart';
import '../screens/dashboard_screen.dart';
import '../screens/verify_email.dart';
import 'navigator_service.dart';

import '../constants/currentuser.dart';
import '../constants/api_uri.dart';
import 'general.dart';

class AccountManager extends ChangeNotifier {
  String passwordValidatorMsg = "password must be greater than 5 characters";
  String emailValidatorMsg = "invalid email";
  String _loginMsg = "";
  String _msg = "";
  bool _isLoding = false;
  String get loginMsg => _loginMsg;
  bool get isLoding => _isLoding;
  String get msg => _msg;
  bool _hasAdminAccess = false;
  bool get hasAdminAccess => _hasAdminAccess;

  UserModel? _userModel;
  UserModel get userModel => _userModel!;
  AccountManager() {
    _loginMsg = "";
    _msg = "";
    _isLoding = false;

    notifyListeners();

    if (_userModel != null) {
      print("jjjj");
      refreshUser(_userModel!.id);
    } else {
      print("1111");
    }
  }
  notifyListeners();

  void toggelAdmin(bool isAdmin) {
    _hasAdminAccess = isAdmin;
    notifyListeners();
  }

  String fieldValidatorMsg(String key) {
    return '$key is empty';
  }

  bool passwordValidator(String password) {
    return password.trim().length > 5;
  }

  bool phoneValidator(String phone) {
    return phone.trim().length == 11;
  }

  bool fieldValidator(String input) {
    return input.trim().isEmpty;
  }

  bool verifyPassword(String password, String cpassword) {
    return password == cpassword;
  }

  bool emailValidator(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    return emailValid;
  }

  void login(String email, String password) async {
    _isLoding = true;
    _loginMsg = "";
    //bool isSuccessful = false;
    saveEmail(email);
    notifyListeners();

    try {
      Response response = await http.post(Uri.parse(loginUrl),
          body: {"email": email, "password": password});
      dynamic result = jsonDecode(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(result);

        /// GeneralRepo().navigateToScreen2(HomeScreen());
        // isSuccessful = true;
        if (result["status"] == true) {
          UserModel userModel = UserModel.fromJson(result["data"]);
          currentUser = userModel;
          _userModel = userModel;
          notifyListeners();
          checkEmailVerified();

          // NavigationService().replaceScreen(DashboardScreen(
          //   userModel: userModel,
          // ));
        } else {
          _loginMsg = result["message"];
        }
        // print(result);
        // var username = result["username"];
        // var access = result["access"];
        // var token = result["token"];

        //_loginMsg = result["message"];
        // _loginMsg = "successfull";
      } else {
        _loginMsg =
            "An error occoured"; //response.statusCode.toString(); //"An Error occoured";
      }
    } catch (e) {
      _loginMsg = e.toString();

      ///notifyListeners();
    }

    _isLoding = false;
    notifyListeners();
    //return isSuccessful;
  }

  channelCreateUser({required Map<String, dynamic> userData}) async {
    _isLoding = true;
    notifyListeners();

    try {
      //print(userData);

      Response response = await http.post(Uri.parse(createAccountUrl),
          body: jsonEncode(userData),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' "",
          });
      _isLoding = false;
      dynamic result = jsonDecode(response.body);

      print(result);

      if (response.statusCode == 200) {
        var status = result['status'];
        if (status == true) {
          _msg = "success";
          UserModel userModel = UserModel.fromJson(result['data']);

          currentUser = userModel;
          _userModel = userModel;
          notifyListeners();
          checkEmailVerified();
        } else {
          _msg = result['message'];
        }
        //_msg = "success";
        //result["message"];
        // Map<String, dynamic> extra = {
        //   "access": "user",
        //   "token": "123456",
        //   "status": "active",
        //   "balance": "90000",
        //   "coins": coins
        // };

      } else {
        _msg = "An error occoures " + response.statusCode.toString();
      }

      notifyListeners();
      // return false;
    } catch (e) {
      _isLoding = false;
      _msg = e.toString();
    }

    notifyListeners();

    return false;
  }

  void refreshUser(
    var id,
  ) async {
    Response response =
        await http.post(Uri.parse(getUsrByIdUrl), body: {"id": id.toString()});
    dynamic result = jsonDecode(response.body);
    //print(response.statusCode);

    if (response.statusCode == 200) {
      //print(result);

      /// GeneralRepo().navigateToScreen2(HomeScreen());
      // isSuccessful = true;
      if (result["status"] == true) {
        UserModel userModel = UserModel.fromJson(result["data"]);
        currentUser = userModel;
        _userModel = userModel;

        notifyListeners();
        sortCoin();
      }
    }
  }

  void sortCoin() {
    userModel.coins.sort((a, b) => b['balance'].compareTo(a['balance']));

    notifyListeners();
  }

  void updateUser({required Map<String, dynamic> userData}) async {
    _isLoding = true;
    notifyListeners();

    try {
      print(userData);

      Response response = await http
          .post(Uri.parse(updateUserUrl), body: jsonEncode(userData), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' "",
      });
      _isLoding = false;
      dynamic result = jsonDecode(response.body);

      print(result);

      if (response.statusCode == 200) {
        var status = result['status'];
        if (status == true) {
          _msg = "success";
          UserModel userModel = UserModel.fromJson(result['data']);

          currentUser = userModel;
          _userModel = userModel;
          notifyListeners();

          // NavigationService().replaceScreen(DashboardScreen(
          //   userModel: userModel,
          // ));
        } else {
          _msg = result['message'];
        }
        //_msg = "success";
        //result["message"];
        // Map<String, dynamic> extra = {
        //   "access": "user",
        //   "token": "123456",
        //   "status": "active",
        //   "balance": "90000",
        //   "coins": coins
        // };

      } else {
        _msg = "An error occoures " + response.statusCode.toString();
      }

      notifyListeners();
      // return false;
    } catch (e) {
      _isLoding = false;
      _msg = e.toString();
    }

    notifyListeners();
  }

  void updateUserPassword({required Map<String, dynamic> userData}) async {
    _isLoding = true;
    notifyListeners();
    //print(userData);

    if (userData['new_password'].toString() !=
        userData['confirm_password'].toString()) {
      _msg = "new password does not match confirm password";
      // print(userData);
      _isLoding = false;
      notifyListeners();
      return;
    }

    try {
      print(userData);

      Response response = await http.post(Uri.parse(update_user_passwordUrl),
          body: jsonEncode(userData),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' "",
          });
      _isLoding = false;
      dynamic result = jsonDecode(response.body);

      print(result);

      if (response.statusCode == 200) {
        var status = result['status'];
        if (status == true) {
          _msg = "Please signin again with your new password";
          UserModel userModel = UserModel.fromJson(result['data']);

          // currentUser = userModel;
          // _userModel = userModel;
          notifyListeners();

          Future.delayed(Duration(seconds: 3), () {
            NavigationService().replaceScreen(SignIn());
          });
        } else {
          _msg = result['message'];
        }
        //_msg = "success";
        //result["message"];
        // Map<String, dynamic> extra = {
        //   "access": "user",
        //   "token": "123456",
        //   "status": "active",
        //   "balance": "90000",
        //   "coins": coins
        // };

      } else {
        _msg = "An error occoures " + response.statusCode.toString();
      }

      notifyListeners();
      // return false;
    } catch (e) {
      _isLoding = false;
      _msg = e.toString();
    }

    notifyListeners();
  }

  dynamic getCurrentRate(String symbol) async {
    var response = await http.get(
      Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=" +
              symbol.toLowerCase()),
    );

    var result = jsonDecode(response.body);
    // print("==");
    // print(result);

    return result;
  }

  void updateCoins() async {
    for (int i = -1; i < userModel.coins.length; i++) {
      // print(element['symbol'].toString().toUpperCase());
      try {
        var result;
        if (i == -1) {
          result = await getCurrentRate("bitcoin".toString());
        } else {
          result =
              await getCurrentRate(userModel.coins[i]['symbol'].toString());
        }
        // print(result);
        // print(result['current_price']);
        var rate = result[0]['current_price'];
        //if (rate != null) {
        print(rate);

        var newPrice = (userModel.coins[i]['balance'] * rate).round();
        userModel.coins[i]['amount'] = newPrice.toString();
        userModel.balance += newPrice;

        //currentUser!.coins[i]['balance'] = 88;
        //userModel.coins[i]['balance'] * rate;
        userModel.coins[i]['current_price'] = rate.toString();
        notifyListeners();

        //print(result);
        // print(rate);
        // }
      } catch (e) {
        print(e);
      }
    }
  }

  void checkEmailVerified() async {
    updateCoins();
    if (userModel.email_verified_at == "" ||
        userModel.email_verified_at == null) {
      //GeneralRepo().navigateToScreen2(VerifyEmail());
      NavigationService().replaceScreen(VerifyEmail());

      return;
    } else if (userModel.transaction_pin == "" ||
        userModel.transaction_pin == null) {
      //print("pppppuuu");

      NavigationService().replaceScreen(AddTransactionPin());
    } else {
      NavigationService().replaceScreen(DashboardScreen(
        userModel: userModel,
      ));

      //return true;

    }
    sortCoin();
  }

  void resendToken() async {
    _isLoding = true;
    _msg = "";
    notifyListeners();
    var response = await http.post(Uri.parse(resend_verification),
        body: {"user_id": userModel.id.toString()});
    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        _isLoding = false;
        if (result['status']) {
          _msg = result['msg'];
        } else {
          _isLoding = false;
          _msg = "Message sending falied";
        }
        notifyListeners();
      } else {
        _isLoding = false;
        _msg = "An error occoured";
        notifyListeners();
      }
    } catch (e) {
      _isLoding = false;
      _msg = e.toString();
      notifyListeners();
    }
  }

  void verifyEmail(String token) async {
    _isLoding = true;
    _msg = "";
    var response = await http.post(Uri.parse(verification),
        body: {"user_id": userModel.id.toString(), "code": token});
    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        _isLoding = false;
        if (result['status']) {
          print(result['data']['email_verified_at']);
          userModel.email_verified_at = result['data']['email_verified_at'];
          print(userModel.email_verified_at);
          notifyListeners();

          // if (!checkPin) {
          //   NavigationService().replaceScreen(AddTransactionPin());
          // }

          ///
          checkEmailVerified();
          _msg = "Verified";
        } else {
          _msg = "Verification Failed: cross-check token";
        }

        notifyListeners();
      } else {
        _isLoding = false;
        _msg = "An error occoured";
        notifyListeners();
      }
    } catch (e) {
      _isLoding = false;
      _msg = e.toString();
      notifyListeners();
    }
  }

  createTransactionToken(String pin) async {
    _isLoding = true;
    _msg = "";
    notifyListeners();
    var response = await http.post(Uri.parse(set_transaction_pin), body: {
      "transaction_pin": pin,
      "type": "0",
      "user_id": userModel.id.toString()
    });
    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        _isLoding = false;
        if (result['status']) {
          userModel.transaction_pin = pin;
          notifyListeners();
          checkEmailVerified();

          _msg = "Successful";
        } else {
          _msg = result['msg'];
        }

        notifyListeners();
      } else {
        _isLoding = false;
        _msg = "An error occoured";
        notifyListeners();
      }
    } catch (e) {
      _isLoding = false;
      _msg = e.toString();
      notifyListeners();
    }
  }

  void forgotPassword(String email, int type) async {
    _isLoding = true;
    _msg = "";
    notifyListeners();
    var response =
        await http.post(Uri.parse(forgot_pasword), body: {"email": email});
    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        _isLoding = false;
        if (result['status']) {
          if (type == 0) {
            NavigationService().replaceScreen(ResetPassword(email: email));
          }
          notifyListeners();

          _msg = "Email sent";
        } else {
          _msg = result['msg'];
        }

        notifyListeners();
      } else {
        _isLoding = false;
        _msg = "An error occoured";
        notifyListeners();
      }
    } catch (e) {
      _isLoding = false;
      _msg = e.toString();
      notifyListeners();
    }
  }

  void resetPassword(
      String email, String code, String new_password, String cpassword) async {
    _isLoding = true;
    _msg = "";
    notifyListeners();

    if (new_password != cpassword) {
      _isLoding = false;
      _msg = "Password does not match";
      notifyListeners();
      return;
    }
    var response = await http.post(Uri.parse(reset_password),
        body: {"email": email, "code": code, "new_password": new_password});
    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        _isLoding = false;
        if (result['status']) {
          notifyListeners();

          _msg = "Successful";
          Future.delayed(
              Duration(
                seconds: 1,
              ), () {
            NavigationService().replaceScreen(SignIn());
          });
        } else {
          _msg = result['msg'];
        }

        notifyListeners();
      } else {
        _isLoding = false;
        _msg = "An error occoured";
        notifyListeners();
      }
    } catch (e) {
      _isLoding = false;
      _msg = e.toString();
      notifyListeners();
    }
  }

  void updatePin(String pin, String password) async {
    _isLoding = true;
    _msg = "";
    notifyListeners();

    var response = await http.post(Uri.parse(set_transaction_pin), body: {
      "transaction_pin": pin,
      "type": "1",
      "user_id": userModel.id.toString(),
      "password": password.trim()
    });
    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        _isLoding = false;
        if (result['status']) {
          userModel.transaction_pin = pin;
          _msg = "Successful changed";
          notifyListeners();
          //checkEmailVerified();

        } else {
          _msg = result['msg'];
        }

        notifyListeners();
      } else {
        _isLoding = false;
        _msg = "An error occoured";
        notifyListeners();
      }
    } catch (e) {
      _isLoding = false;
      _msg = e.toString();
      notifyListeners();
    }

    //print(userData);
  }

  saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    if (email != null) {
      return email;
    }
    return "";
  }

  reset() {
    _msg = "";
    _isLoding = false;
  }
}
