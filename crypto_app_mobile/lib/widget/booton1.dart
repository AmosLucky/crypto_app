import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  VoidCallback onPressed;
  String? text;
  Color color;
  Color textColor;
  double width;
  double? height;
  Button1(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.textColor,
      required this.width,
      this.height = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: color,
        onPressed: onPressed,
        child: Text(text!),
        textColor: textColor,
      ),
    );
  }
}
