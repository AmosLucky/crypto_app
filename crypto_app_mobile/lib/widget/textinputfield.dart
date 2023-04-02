import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class TextInput extends StatefulWidget {
  String labelText;
  TextInputType? textInputType;
  TextEditingController controller;
  bool? isPassword;
  IconData? icon;
  String? Function(String?)? validator;
  //Function validator;

  TextInput(
      {Key? key,
      required this.labelText,
      this.textInputType = TextInputType.text,
      this.isPassword = false,
      required this.controller,
      this.icon,
      required this.validator})
      : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Container(
      width: getSize(context).width / 1.3,
      child: TextFormField(
        keyboardType: widget.textInputType,
        obscureText: widget.isPassword! && hidePassword,
        controller: widget.controller,
        cursorColor: primaryColor,
        style: TextStyle(color: primaryColor),
        decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(fontFamily: "DidactGothic"),
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            filled: true,
            fillColor: Colors.white38,
            contentPadding: const EdgeInsets.all(8.0),
            prefixIcon: Icon(
              widget.icon,
              color: primaryColor,
            ),
            suffixIcon: widget.isPassword!
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                      hidePassword
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      color: primaryColor,
                    ))
                : null
            // focusedBorder: UnderlineInputBorder(
            //     borderSide: new BorderSide(color: primaryColor))
            ),
        validator: widget.validator,
      ),
    );
  }
}
