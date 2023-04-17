import 'dart:developer';

import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/constants/dimensions.dart';
import 'package:crypto_app_mobile/repos/account_manager.dart';
import 'package:crypto_app_mobile/repos/general.dart';
import 'package:crypto_app_mobile/screens/edit_profile.dart';
import 'package:crypto_app_mobile/screens/sign_in.dart';
import 'package:crypto_app_mobile/widget/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'change_password.dart';

class ProfileSceen extends StatefulWidget {
  const ProfileSceen({super.key});

  @override
  State<ProfileSceen> createState() => _ProfileSceenState();
}

class _ProfileSceenState extends State<ProfileSceen> {
  @override
  Widget build(BuildContext context) {
    AccountManager accountManager = context.watch<AccountManager>();
    return Scaffold(
      backgroundColor: lightIndego,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: deepIndego,
        elevation: 1,
        title: Text("My Profile"),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: IconButton(
              onPressed: () {
                Alert(
                  context: context,
                  title: "Logout",
                  desc: "Are you sure you want to logout?.",
                  buttons: [
                    DialogButton(
                      color: primaryColor,
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => SignIn()),
                          (route) => false),
                      width: 120,
                    ),
                    DialogButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
              },
              icon: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(children: [
          Container(
              height: getSize(context).height * 0.2,
              width: getSize(context).width,
              color: deepIndego,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BoldText(
                    text: accountManager.userModel.name,
                    textColor: whiteColor,
                  )
                ],
              )),
          Container(
            color: lightIndego,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(children: [
              InkWell(
                onTap: () {
                  GeneralRepo().navigateToScreen(context, EditProfile());
                },
                child: Card(
                    child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text("Edit Profile"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                )),
              ),
              InkWell(
                onTap: () {
                  GeneralRepo().navigateToScreen(context, ChangePassword());
                },
                child: Card(
                    child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.lock),
                  ),
                  title: Text("Change Password"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                )),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
