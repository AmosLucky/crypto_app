import 'package:crypto_app_mobile/models/transaction_model.dart';
import 'package:flutter/material.dart';

import 'transaction_trailing.dart';

class SingleTransaction extends StatelessWidget {
  TransactionModel transactionModel;
  SingleTransaction({super.key, required this.transactionModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
            child: Text(transactionModel.name.substring(0, 1).toUpperCase())),
        title: Text("\$" + transactionModel.amount.toString()),
        subtitle: Text(transactionModel.status.toString()),
        trailing: TransactionTailing(
          type: transactionModel.type,
        ),
      ),
    );
  }
}
