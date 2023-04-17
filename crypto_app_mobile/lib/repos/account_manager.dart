import 'dart:convert';

import 'package:crypto_app_mobile/screens/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/usermodel.dart';
import '../models/usermodel.dart';
import '../screens/dashboard_screen.dart';
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
    print("opppp");
    notifyListeners();

    if (_userModel != null) {
      print("jjjj");
      refreshUser(_userModel!.id);
    } else {
      print("1111");
    }
  }

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

          NavigationService().replaceScreen(DashboardScreen(
            userModel: userModel,
          ));
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
      print(userData);

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

          NavigationService().replaceScreen(DashboardScreen(
            userModel: userModel,
          ));

          return true;
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
      }
    }
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
}
