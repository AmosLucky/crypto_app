import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/colors.dart';

class CircularAction extends StatelessWidget {
  IconData iconData;
  String text;
  Function()? onTap;

  CircularAction(
      {super.key,
      required this.iconData,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            color: faireIndego,
            shape: CircleBorder(),
            child: Container(
              height: 45,
              width: 54,
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
