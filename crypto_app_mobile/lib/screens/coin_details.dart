import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/models/coin_model.dart';
import 'package:crypto_app_mobile/models/transaction_model.dart';
import 'package:crypto_app_mobile/screens/send_screen.dart';
import 'package:crypto_app_mobile/widget/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../repos/general.dart';
import '../repos/transaction_repo.dart';
import '../widget/circular_action.dart';
import '../widget/single_transaction.dart';
import 'receive_screen.dart';

class CoinDetails extends StatefulWidget {
  CoinModel coinModel;
  CoinDetails({super.key, required this.coinModel});

  @override
  State<CoinDetails> createState() => _CoinDetailsState();
}

class _CoinDetailsState extends State<CoinDetails> {
  @override
  Widget build(BuildContext context) {
    TransactionRepo transactionRepo = context.watch<TransactionRepo>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: lightIndego,
        title: BoldText(text: widget.coinModel.name),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: lightIndego,
            child: Column(children: [
              Container(
                child: Image.network(
                  widget.coinModel.image,
                  height: 100,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: BoldText(
                  text: "\$" + widget.coinModel.balance.toString(),
                  textColor: whiteColor,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularAction(
                    iconData: Icons.arrow_upward,
                    text: "Send",
                    onTap: () {
                      GeneralRepo().navigateToScreen(
                          context,
                          SendScreen(
                            coinModel: widget.coinModel,
                          ));
                    },
                  ),
                  CircularAction(
                    iconData: Icons.arrow_downward,
                    text: "Recieve",
                    onTap: () {
                      GeneralRepo().navigateToScreen(
                          context,
                          ReceiveScreen(
                            coinModel: widget.coinModel,
                          ));
                    },
                  ),
                  CircularAction(
                    iconData: Icons.copy,
                    text: "Copy",
                    onTap: () {},
                  )
                ],
              )
            ]),
          ),
          Container(
            child: FutureBuilder(
              future: transactionRepo.getUserTransactions(widget.coinModel.id),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error"),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("No data"),
                  );
                }
                List data = snapshot.data as List;

                return ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SingleTransaction(
                        transactionModel:
                            TransactionModel.fromJson(data[index]),
                      );
                    });
              }),
            ),
          ),
        ],
      )),
    );
  }
}
