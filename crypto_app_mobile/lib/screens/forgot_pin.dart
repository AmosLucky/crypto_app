import 'dart:math';

import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/constants/currentuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/dimensions.dart';
import '../repos/account_manager.dart';
import '../widget/booton1.dart';
import '../widget/textinputfield.dart';

class ForgetPin extends StatefulWidget {
  const ForgetPin({super.key});

  @override
  State<ForgetPin> createState() => _ForgetPinState();
}

class _ForgetPinState extends State<ForgetPin> {
  var _formKey = GlobalKey<FormState>();

  var passwordCRT = new TextEditingController();

  var newPinCTR = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    AccountManager accountManager = context.watch<AccountManager>();

    return Scaffold(
      backgroundColor: lightIndego,
      appBar: AppBar(
          elevation: 1, backgroundColor: deepIndego, title: Text("My Profile")),
      body: SingleChildScrollView(
        child: Container(
          height: getSize(context).height * 0.8,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Card(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getSize(context).height * 0.001,
                      ),
                      TextInput(
                        isPassword: true,
                        labelText: "Enter password",
                        controller: passwordCRT,
                        icon: Icons.lock,
                        validator: (text) {
                          /// accountManager.inputValidator(text!, "username");
                          if (!accountManager.passwordValidator(text!)) {
                            return accountManager.passwordValidatorMsg;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextInput(
                        labelText: "New Transaction pin",
                        controller: newPinCTR,
                        icon: Icons.lock,
                        isPassword: true,
                        validator: (text) {
                          /// accountManager.inputValidator(text!, "username");
                          if (!accountManager.passwordValidator(text!)) {
                            return accountManager.passwordValidatorMsg;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(top: 10),
                      //   //color: Colors.amber,
                      //   child: Row(
                      //       //crossAxisAlignment: CrossAxisAlignment.start,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         InkWell(child: Text("Forget password")),
                      //       ]),
                      // ),
                      SizedBox(
                        height: 0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Visibility(
                          visible: accountManager.msg.length > 2,
                          child: Text(
                            accountManager.msg,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Visibility(
                              visible: accountManager.isLoding,
                              child: CupertinoActivityIndicator())),
                      Button1(
                        onPressed: () async {
                          accountManager.updatePin(
                            newPinCTR.text,
                            passwordCRT.text,
                          );
                          //GeneralRepo().navigateToScreen(context, HomeScreen());
                        },
                        text: "Change",
                        color: primaryColor,
                        textColor: whiteColor,
                        width: getSize(context).width / 1.3,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
