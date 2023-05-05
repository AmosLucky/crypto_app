import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/models/coin_model.dart';
import 'package:crypto_app_mobile/models/transaction_model.dart';
import 'package:crypto_app_mobile/repos/utils.dart';
import 'package:crypto_app_mobile/screens/send_screen.dart';
import 'package:crypto_app_mobile/widget/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../repos/account_manager.dart';
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
    AccountManager accountManager = context.watch<AccountManager>();

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
                  // Image.network(
                  //   widget.coinModel.image,
                  //   height: 100,
                  // ),
                  child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(widget.coinModel.image),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                child: BoldText(
                  text: makeCurrency(widget.coinModel.balance),
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
                    onTap: () async {
                      print(widget.coinModel.address);
                      await copyString(widget.coinModel.address);
                      // await Clipboard.setData(
                      //     ClipboardData(text: widget.coinModel.address));
                      showSnackBar(
                          context, "Copied: " + widget.coinModel.address);
                    },
                  )
                ],
              )
            ]),
          ),
          Container(
            child: FutureBuilder(
              future: transactionRepo.getUserTransactions(
                  accountManager.userModel.id, widget.coinModel.id),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("An Error occured"),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("No data"),
                  );
                }
                List data = snapshot.data as List;

                if (data.isEmpty) {
                  return Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Center(
                      child: Text(
                          "No " + widget.coinModel.name + " Transaction found"),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SingleTransaction(
                          transactionModel:
                              TransactionModel.fromJson(data[index]),
                        );
                      }),
                );
              }),
            ),
          ),
        ],
      )),
    );
  }
}
