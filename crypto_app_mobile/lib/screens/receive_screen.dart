import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/constants/dimensions.dart';
import 'package:crypto_app_mobile/models/coin_model.dart';
import 'package:flutter/material.dart';

import '../widget/circular_action.dart';

class ReceiveScreen extends StatefulWidget {
  CoinModel coinModel;
  ReceiveScreen({super.key, required this.coinModel});

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepIndego,
      appBar: AppBar(
          elevation: 1,
          backgroundColor: deepIndego,
          title: Text("Receive " + widget.coinModel.name)),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Card(
              child: Container(
                width: getSize(context).width,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(children: [
                  Image.network(widget.coinModel.qr_code),
                  SizedBox(
                    height: 20,
                  ),
                  Text((widget.coinModel.address))
                ]),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularAction(
                iconData: Icons.copy,
                text: "Copy wallet address",
                onTap: () {},
              )
            ],
          ),
        ],
      )),
    );
  }
}
