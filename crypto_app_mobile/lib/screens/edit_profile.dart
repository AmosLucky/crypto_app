import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/constants/currentuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/dimensions.dart';
import '../repos/account_manager.dart';
import '../widget/booton1.dart';
import '../widget/textinputfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _formKey = GlobalKey<FormState>();

  var emailCRT = new TextEditingController();
  var passwordCRT = new TextEditingController();
  var nameCRT = new TextEditingController();
  var usernameCRT = new TextEditingController();
  @override
  void initState() {
    emailCRT.text = currentUser!.email;
    nameCRT.text = currentUser!.name;
    usernameCRT.text = currentUser!.username;
    // TODO: implement initState
    super.initState();
  }

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
                        labelText: "Full name",
                        controller: nameCRT,
                        icon: Icons.person,
                        validator: (text) {
                          /// accountManager.inputValidator(text!, "username");
                          if (accountManager.fieldValidator(text!)) {
                            return accountManager.fieldValidatorMsg("name");
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
                            return accountManager.fieldValidatorMsg("username");
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
                            accountManager.updateUser(userData: {
                              "email": emailCRT.text.trim(),
                              "password": passwordCRT.text.trim(),
                              "name": nameCRT.text.trim(),
                              "username": usernameCRT.text.trim(),
                              "user_id": accountManager.userModel.id
                            });
                          }
                          //GeneralRepo().navigateToScreen(context, HomeScreen());
                        },
                        text: "Update",
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
