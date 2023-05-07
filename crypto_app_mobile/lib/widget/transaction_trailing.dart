import 'package:crypto_app_mobile/models/transaction_model.dart';
import 'package:flutter/material.dart';


class TransactionTailing extends StatelessWidget {
  var type;
  TransactionModel tm;
  TransactionTailing({super.key, required this.type, required this.tm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        type == "credit"
            ? Icon(
                Icons.arrow_downward,
                color: Colors.green,
              )
            : Icon(
                Icons.arrow_upward,
                color: Colors.red,
              ),
        Text(type),
        Text(
          tm.status.toString(),
          style: TextStyle(fontSize: 9),
        )
      ],
    );
  }
}
