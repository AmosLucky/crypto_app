import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionTailing extends StatelessWidget {
  var type;
  TransactionTailing({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return type == "1"
        ? Container(
            child: Column(
              children: [
                Icon(
                  Icons.arrow_upward,
                  color: Colors.green,
                ),
                Text("Recieved")
              ],
            ),
          )
        : Container(
            child: Column(
              children: [
                Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                ),
                Text("Sent")
              ],
            ),
          );
  }
}
