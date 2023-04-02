import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      appName,
      style: TextStyle(
          fontWeight: FontWeight.w900, fontSize: 32, color: primaryColor),
    );
  }
}
