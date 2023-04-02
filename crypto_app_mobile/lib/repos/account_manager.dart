import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/usermodel.dart';
import '../screens/home_screen.dart';
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

  void toggelAdmin(bool isAdmin) {
    _hasAdminAccess = isAdmin;
    notifyListeners();
  }

  AccountManager() {
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
    notifyListeners();

    try {
      Response response = await http.post(Uri.parse(loginUrl),
          body: {"email": email, "password": password});
      dynamic result = jsonDecode(response.body);
      print(response.statusCode);

      if (response.statusCode == 201) {
        print(result);

        /// GeneralRepo().navigateToScreen2(HomeScreen());
        // isSuccessful = true;
        // if (result["status"] == true) {

        UserModel userModel = UserModel(
            id: "1",
            name: "Lucky",
            fullname: "Mark Lucky",
            email: "mark@gmail.com",
            access: "user",
            token: "123456",
            status: "active",
            balance: "balanace",
            coins: coins);
        //   currentUser = userModel;

        NavigationService().navigateToScreen(HomeScreen(
          userModel: userModel,
        ));
        // }
        // print(result);
        // var username = result["username"];
        // var access = result["access"];
        // var token = result["token"];

        //_loginMsg = result["message"];
        _loginMsg = "successfull";
      } else {
        _loginMsg =
            "Not true"; //response.statusCode.toString(); //"An Error occoured";
      }
    } catch (e) {
      _loginMsg = e.toString();

      ///notifyListeners();
    }

    _isLoding = false;
    notifyListeners();
    //return isSuccessful;
  }

  Future<bool> channelCreateUser({required Map userData}) async {
    userData['mobile'] = userData['phone'];

    try {
      print(userData);
      _isLoding = true;
      notifyListeners();

      Response response = await http.post(Uri.parse(createAccountUrl),
          body: jsonEncode(userData),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + currentUser!.token!.toString(),
          });
      _isLoding = false;
      dynamic result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _msg = result["message"];
        return true;
      } else {
        _msg = result["message"];
      }

      notifyListeners();
      return false;
    } catch (e) {
      _isLoding = false;
      _msg = e.toString();
    }

    notifyListeners();

    return false;
  }
}
