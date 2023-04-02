import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';
import '../repos/account_manager.dart';
import '../repos/general.dart';
import '../widget/app_title.dart';
import '../widget/booton1.dart';
import '../widget/opacity_bg.dart';
import '../widget/textinputfield.dart';
import 'sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  var _formKey = GlobalKey<FormState>();
  AccountManager accountManager = AccountManager();
  var emailCRT = new TextEditingController();
  var passwordCRT = new TextEditingController();
  var nameCRT = new TextEditingController();
  var usernameCRT = new TextEditingController();

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
                            Container(child: AppTitle()),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            // Image.asset(
                            //   "assets/images/sign_in.png",
                            //   height: 280,
                            // ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("Sign up to continue")),
                            SizedBox(
                              height: size.height * 0.001,
                            ),
                            TextInput(
                              labelText: "Full name",
                              controller: nameCRT,
                              icon: Icons.person,
                              validator: (text) {
                                /// accountManager.inputValidator(text!, "username");
                                if (accountManager.fieldValidator(text!)) {
                                  return accountManager
                                      .fieldValidatorMsg("name");
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextInput(
                              labelText: "Username",
                              controller: usernameCRT,
                              icon: Icons.person,
                              validator: (text) {
                                /// accountManager.inputValidator(text!, "username");
                                if (accountManager.fieldValidator(text!)) {
                                  return accountManager
                                      .fieldValidatorMsg("username");
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
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
                                child: Text(accountManager.msg),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Visibility(
                                    visible: accountManager.isLoding,
                                    child: CupertinoActivityIndicator())),
                            Button1(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  accountManager.channelCreateUser(userData: {
                                    "email": emailCRT.text.trim(),
                                    "password": passwordCRT.text.trim(),
                                    "name": nameCRT.text.trim(),
                                    "username": usernameCRT.text.trim()
                                  });
                                }
                                //GeneralRepo().navigateToScreen(context, HomeScreen());
                              },
                              text: "Sign up",
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
                                  Text("Old user?"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        GeneralRepo().navigateToScreen(
                                            context, SignIn());
                                      },
                                      child: Text(
                                        "Sign in",
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
