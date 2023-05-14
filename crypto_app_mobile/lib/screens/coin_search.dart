import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/constants/dimensions.dart';
import 'package:crypto_app_mobile/models/coin_model.dart';
import 'package:crypto_app_mobile/models/transaction_model.dart';
import 'package:crypto_app_mobile/repos/coin_repo.dart';
import 'package:crypto_app_mobile/repos/general.dart';
import 'package:crypto_app_mobile/screens/coin_details.dart';
import 'package:crypto_app_mobile/screens/receive_screen.dart';
import 'package:crypto_app_mobile/screens/send_screen.dart';
import 'package:crypto_app_mobile/widget/single_coin.dart';
import 'package:crypto_app_mobile/widget/single_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../repos/account_manager.dart';

class CoinSearch extends StatefulWidget {
  String searchType;
  CoinSearch({super.key, required this.searchType});

  @override
  State<CoinSearch> createState() => _CoinSearchState();
}

class _CoinSearchState extends State<CoinSearch> {
  @override
  Widget build(BuildContext context) {
    AccountManager accountManager = context.watch<AccountManager>();
    CoinRepo coinRepo = context.watch<CoinRepo>();

    return WillPopScope(
      onWillPop: () async {
        coinRepo.setKeyWord("");

        return await true;
      },
      child: Container(
        color: lightIndego,
        //height: getSize(context).height * 0.85,
        child: Column(children: [
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.cancel,
                color: whiteColor,
              ),
              onPressed: () {
                coinRepo.setKeyWord("");
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  fillColor: whiteColor,
                  filled: true,
                  hintText: "Search coin",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)),
              onChanged: (value) {
                coinRepo.setKeyWord(value);
              },
            ),
          ),
          Container(
            height: getSize(context).height * 0.7,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                itemCount: accountManager.userModel.coins
                    .where((element) => element['name']
                        .toString()
                        .toLowerCase()
                        .contains(coinRepo.keyword.toLowerCase()))
                    .toList()
                    .length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      coinRepo.setKeyWord("");
                      if (widget.searchType == "send") {
                        GeneralRepo().navigateToScreen(
                            context,
                            SendScreen(
                                coinModel: CoinModel.fromJson(
                                    accountManager.userModel.coins[index])));
                      } else {
                        GeneralRepo().navigateToScreen(
                            context,
                            ReceiveScreen(
                                coinModel: CoinModel.fromJson(
                                    accountManager.userModel.coins[index])));
                      }
                    },
                    child: SingleCoin(
                        coinModel: CoinModel.fromJson(
                            accountManager.userModel.coins[index])),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
