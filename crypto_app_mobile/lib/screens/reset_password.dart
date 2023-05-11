import 'package:crypto_app_mobile/screens/sign_in.dart';
import 'package:crypto_app_mobile/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';
import '../repos/account_manager.dart';
import '../repos/general.dart';
import '../widget/app_title.dart';
import '../widget/booton1.dart';
import '../widget/opacity_bg.dart';
import '../widget/textinputfield.dart';

class ResetPassword extends StatefulWidget {
  String email;
  ResetPassword({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var _formKey = GlobalKey<FormState>();
  AccountManager accountManager = AccountManager();
  var code = new TextEditingController();
  var password = new TextEditingController();
  var vpassword = new TextEditingController();

  @override
  void initState() {
    // emailCRT.text = "mark@gmail.com";
    // passwordCRT.text = "123456";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AccountManager accountManager = context.watch<AccountManager>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: OpacityBg(
          context,
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            Container(
                                child: AppTitle(
                              fontSize: 25,
                            )),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            // Image.asset(
                            //   "assets/images/sign_in.png",
                            //   height: 280,
                            // ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("Reset password")),

                            SizedBox(
                              height: size.height * 0.001,
                            ),
                            TextInput(
                              labelText: "Code ",
                              controller: code,
                              icon: Icons.email,
                              validator: (text) {
                                /// accountManager.inputValidator(text!, "username");
                                if (accountManager.fieldValidator(text!)) {
                                  return accountManager
                                      .fieldValidatorMsg("code");
                                }
                              },
                            ),
                            Text("Enter the code we sent to your email"),
                            SizedBox(
                              height: 20,
                            ),
                            TextInput(
                              labelText: "Password ",
                              controller: password,
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

                            TextInput(
                              labelText: "Confirm Password",
                              controller: vpassword,
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

                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              //color: Colors.amber,
                              child: Row(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          accountManager.forgotPassword(
                                              widget.email, 1);
                                        },
                                        child: Text(
                                          "Resend Code",
                                          style: TextStyle(color: primaryColor),
                                        )),
                                  ]),
                            ),
                            SizedBox(
                              height: 0,
                            ),

                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Visibility(
                                visible: accountManager.msg.length > 2,
                                child: Text(accountManager.msg),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Visibility(
                                    visible: accountManager.isLoding,
                                    child: CupertinoActivityIndicator())),
                            Button1(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  accountManager.resetPassword(
                                      widget.email,
                                      code.text.trim(),
                                      password.text.trim(),
                                      vpassword.text.trim());
                                }
                                //GeneralRepo().navigateToScreen(context, HomeScreen());
                              },
                              text: "Reset",
                              color: primaryColor,
                              textColor: whiteColor,
                              width: getSize(context).width / 1.3,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        GeneralRepo().navigateToScreen(
                                            context, SignIn());
                                      },
                                      child: Text(
                                        "Sign in",
                                        style: TextStyle(color: primaryColor),
                                      )),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        GeneralRepo().navigateToScreen(
                                            context, SignUp());
                                      },
                                      child: Text(
                                        "Register",
                                        style: TextStyle(color: primaryColor),
                                      )),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
