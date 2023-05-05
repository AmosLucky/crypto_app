import 'dart:async';

import 'package:crypto_app_mobile/constants/dimensions.dart';
import 'package:flutter/material.dart';
import '/repos/general.dart';
import './sign_in.dart';

import '../constants/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var controler;
  var animation;
  bool isError = false;

  void initState() {
    controler =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: 1.0).animate(controler);
    controler.forward();

    Timer(Duration(seconds: 3), () {
      GeneralRepo().navigateToScreen(context, SignIn());
    });

    //Timer(Duration(seconds: 4), () {});
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controler.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                  scale: animation,
                  child: Image.asset(
                    "assets/images/coinix_black.png",
                    width: getSize(context).width * 0.7,
                  )),
              FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Interval(0.5, 1.0),
                  ),
                ),
                child: Text(
                  slogan,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Visibility(
                  visible: isError,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Internet Error: Please check your network connection"),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            var route = MaterialPageRoute(
                                builder: (BuildContext) => SplashScreen());
                            Navigator.push(context, route);
                          },
                          child: Text("Retry"))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
