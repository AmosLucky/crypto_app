import 'package:crypto_app_mobile/screens/reset_password.dart';
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
import 'forget_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var _formKey = GlobalKey<FormState>();
  AccountManager accountManager = AccountManager();
  var emailCRT = new TextEditingController();
  var passwordCRT = new TextEditingController();
  @override
  void initState() {
    getOldEmail();
    // emailCRT.text = "mark@gmail.com";
    // passwordCRT.text = "123456";
    // TODO: implement initState
    super.initState();
  }

  getOldEmail() async {
    emailCRT.text = await AccountManager().getEmail();
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
                                child: Text("Sign in to continue")),
                            SizedBox(
                              height: size.height * 0.001,
                            ),
                            TextInput(
                              labelText: "Email",
                              controller: emailCRT,
                              icon: Icons.email,
                              validator: (text) {
                                /// accountManager.inputValidator(text!, "username");
                                if (!accountManager.emailValidator(text!)) {
                                  return accountManager.emailValidatorMsg;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextInput(
                              labelText: "Password",
                              controller: passwordCRT,
                              icon: Icons.lock,
                              validator: (text) {
                                if (!accountManager.passwordValidator(text!)) {
                                  return accountManager.passwordValidatorMsg;
                                }
                              },
                              isPassword: true,
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
                                          GeneralRepo().navigateToScreen(
                                              context, ForgetPassword());
                                        },
                                        child: Text(
                                          "Forgot password?",
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
                                visible: accountManager.loginMsg.length > 2,
                                child: Text(accountManager.loginMsg),
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
                                  accountManager.login(emailCRT.text.trim(),
                                      passwordCRT.text.trim());
                                }
                                //GeneralRepo().navigateToScreen(context, HomeScreen());
                              },
                              text: "Sign In",
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
                                  Text("New user?"),
                                  SizedBox(
                                    width: 20,
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
