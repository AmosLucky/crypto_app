import 'package:crypto_app_mobile/screens/sign_in.dart';
import 'package:crypto_app_mobile/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';
import '../repos/account_manager.dart';
import '../repos/general.dart';
import '../widget/app_title.dart';
import '../widget/booton1.dart';
import '../widget/opacity_bg.dart';
import '../widget/textinputfield.dart';

class AddTransactionPin extends StatefulWidget {
  const AddTransactionPin({Key? key}) : super(key: key);

  @override
  State<AddTransactionPin> createState() => _AddTransactionPinState();
}

class _AddTransactionPinState extends State<AddTransactionPin> {
  var _formKey = GlobalKey<FormState>();
  AccountManager accountManager = AccountManager();
  //var emailCRT = new TextEditingController();
  var token = new TextEditingController();
  List<TextStyle?> otpTextStyles = [];
  @override
  void initState() {
    super.initState();
    otpTextStyles = [
      createStyle(),
      createStyle(),
      createStyle(),
      createStyle(),
    ];
  }

  TextStyle? createStyle() {
    return TextStyle(
        color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold);
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
                            // Container(
                            //     child: AppTitle(
                            //   fontSize: 25,
                            // )),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            // Image.asset(
                            //   "assets/images/sign_in.png",
                            //   height: 280,
                            // ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Create a four digit security pin",
                                  style: TextStyle(fontSize: 18),
                                )),

                            SizedBox(
                              height: size.height * 0.001,
                            ),
                            // TextInput(
                            //   labelText: "Email",
                            //   controller: emailCRT,
                            //   icon: Icons.email,
                            // validator: (text) {
                            //   /// accountManager.inputValidator(text!, "username");
                            //   if (!accountManager.emailValidator(text!)) {
                            //     return accountManager.emailValidatorMsg;
                            //   }
                            // },
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            // TextInput(
                            //   labelText: "Token",
                            //   controller: token,
                            //   icon: Icons.lock,
                            //   validator: (text) {
                            //     // accountManager.inputValidator(text!, "username");
                            //     if (accountManager.fieldValidator(
                            //       text!,
                            //     )) {
                            //       return accountManager
                            //           .fieldValidatorMsg("Token");
                            //     }
                            //   },
                            //   //isPassword: true,
                            // ),
                            OtpTextField(
                              numberOfFields: 4,
                              borderColor: Colors.red,
                              focusedBorderColor: Colors.blueAccent,
                              styles: otpTextStyles,
                              showFieldAsBox: false,
                              borderWidth: 4.0,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here if necessary
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                accountManager
                                    .createTransactionToken(verificationCode);
                              },
                            ),
                            SizedBox(
                              height: 20,
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
                            // Button1(
                            //   onPressed: () async {
                            //     if (_formKey.currentState!.validate()) {
                            //       accountManager
                            //           .verifyEmail(token.text.toString());
                            //     }
                            //     //GeneralRepo().navigateToScreen(context, HomeScreen());
                            //   },
                            //   text: "Verify",
                            //   color: primaryColor,
                            //   textColor: whiteColor,
                            //   width: getSize(context).width / 1.3,
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            Visibility(
                              visible: false,
                              child: Container(
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
