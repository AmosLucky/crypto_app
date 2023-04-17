import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  Color textColor;
  double textSize;
  String text;
  TextView(
      {super.key,
      required this.text,
      this.textColor = Colors.white,
      this.textSize = 200});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
      ),
    );
  }
}
