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
          trailing: BoldText(
            text: makeCurrency(coinModel.balance),
            textColor: whiteColor,
          ),
        ),
      ),
    );
  }
}
