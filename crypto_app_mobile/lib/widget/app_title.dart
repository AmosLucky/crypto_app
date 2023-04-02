import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';

class AppTitle extends StatelessWidget {
  Color? textColor = primaryColor;
  double? fontSize = 32;
  AppTitle({Key? key, this.textColor, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      appName,
      style: TextStyle(
          fontWeight: FontWeight.w900, fontSize: fontSize, color: textColor),
    );
  }
}

class BoldText extends StatelessWidget {
  Color? textColor = primaryColor;
  double? fontSize = 32;
  String? text = "";
  BoldText({Key? key, this.textColor, this.fontSize, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontWeight: FontWeight.w900, fontSize: fontSize, color: textColor),
    );
  }
}
