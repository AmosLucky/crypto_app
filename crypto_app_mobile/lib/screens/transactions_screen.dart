import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/models/transaction_model.dart';
import 'package:crypto_app_mobile/repos/account_manager.dart';
import 'package:crypto_app_mobile/repos/coin_repo.dart';
import 'package:crypto_app_mobile/repos/transaction_repo.dart';
import 'package:crypto_app_mobile/widget/app_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/display_text.dart';
import '../widget/single_transaction.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    CoinRepo coinRepo = context.watch<CoinRepo>();
    AccountManager accountManager = context.watch<AccountManager>();
    TransactionRepo transactionRepo = context.watch<TransactionRepo>();
    return Scaffold(
      backgroundColor: lightIndego,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: deepIndego,
        title: BoldText(
          text: "My Transactions",
          fontSize: 18,
        ),
        elevation: 1,
      ),
      body: Container(
          child: FutureBuilder(
        future: transactionRepo.getUserTransactions(
            accountManager.userModel.id, ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: TextView(
                text: "An Error occored",
                textSize: 18,
              ),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: TextView(
                text: "No transaction found",
                textSize: 18,
              ),
            );
          }

          List data = snapshot.data as List;

          if (data.isEmpty) {
            return Center(
              child: TextView(
                text: "No transaction found",
                textSize: 18,
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SingleTransaction(
                      transactionModel: TransactionModel.fromJson(data[index]),
                    );
                  }),
            ),
          );
        },
      )),
    );
  }
}
