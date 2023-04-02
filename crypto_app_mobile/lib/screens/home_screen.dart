import 'package:crypto_app_mobile/constants/assets.dart';
import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widget/app_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.shade900,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.indigo.shade600,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              height: getSize(context).height * 0.4,
              width: getSize(context).width,
              decoration: BoxDecoration(
                color: Colors.indigo.shade900,
              ),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTitle(
                        textColor: whiteColor,
                        fontSize: 20,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Center(
                  child: Column(children: [
                    Text(
                      "Total balance",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BoldText(
                        textColor: whiteColor, fontSize: 30, text: "\$9000"),
                  ]),
                )
              ]),
            ),
            Container(
              //height: 500,
              margin: EdgeInsets.only(top: getSize(context).height * 0.3),
              width: getSize(context).width,
              decoration: BoxDecoration(
                color: Colors.indigo.shade600,
                //color: Colors.red,
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
            )
          ],
        ));
  }
}
