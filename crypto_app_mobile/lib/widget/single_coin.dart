import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/models/coin_model.dart';
import 'package:crypto_app_mobile/widget/app_title.dart';
import 'package:flutter/material.dart';

import '../repos/utils.dart';

class SingleCoin extends StatelessWidget {
  CoinModel coinModel;
  SingleCoin({super.key, required this.coinModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(2),
        color: faireIndego,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: faireIndego,
            backgroundImage: NetworkImage(coinModel.image),
          ),
          title: Text(
            coinModel.name,
            style: TextStyle(
              color: greyColor,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoldText(
                text: addDollarSign(addCommas(coinModel.amount.toString())),
                textColor: whiteColor,
              ),
              Text(
                (addCommas(coinModel.balance.toString() +
                    " " +
                    coinModel.name.substring(0, 3) +
                    "..")),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          subtitle: Text(
            addDollarSign(addCommas(coinModel.current_price.toString())),
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
