import 'package:crypto_app_mobile/constants/dimensions.dart';
import 'package:crypto_app_mobile/repos/coin_repo.dart';
import 'package:crypto_app_mobile/widget/circular_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../models/coin_model.dart';
import '../repos/account_manager.dart';
import '../widget/app_title.dart';
import '../widget/booton1.dart';
import '../widget/textinputfield.dart';

class SendScreen extends StatefulWidget {
  CoinModel coinModel;
  SendScreen({super.key, required this.coinModel});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController addressCTR = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    CoinRepo coinRepo = context.watch<CoinRepo>();
    AccountManager accountManager = context.watch<AccountManager>();
    return Scaffold(
      backgroundColor: deepIndego,
      appBar: AppBar(
          elevation: 1,
          backgroundColor: deepIndego,
          title: Text("Send " + widget.coinModel.name)),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Center(
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: getSize(context).width,
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Image.network(
                            widget.coinModel.image,
                            height: 80,
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text("Balance"),
                        Container(
                          child: BoldText(
                            text: "\$" + widget.coinModel.balance.toString(),
                            textColor: deepIndego,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextInput(
                          labelText: "Recipient Address",
                          controller: addressCTR,
                          icon: Icons.account_balance_wallet,
                          validator: (text) {
                            /// accountManager.inputValidator(text!, "username");
                            if (!coinRepo.validWalletAddress(text!)) {
                              return accountManager
                                  .fieldValidatorMsg("Recipient Address");
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextInput(
                          labelText: "Amount " + widget.coinModel.symbol,
                          controller: addressCTR,
                          icon: Icons.diamond,
                          textInputType: TextInputType.number,
                          validator: (text) {
                            /// accountManager.inputValidator(text!, "username");
                            if (!coinRepo.validWalletAddress(text!)) {
                              return accountManager.fieldValidatorMsg("Amount");
                            }
                          },
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Visibility(
                            visible: accountManager.msg.length > 2,
                            child: Text(accountManager.msg),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Visibility(
                                visible: accountManager.isLoding,
                                child: CupertinoActivityIndicator())),
                        Button1(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {}
                            //GeneralRepo().navigateToScreen(context, HomeScreen());
                          },
                          text: "Send " + widget.coinModel.name,
                          color: primaryColor,
                          textColor: whiteColor,
                          width: getSize(context).width / 1.3,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CircularAction(
                          iconData: Icons.arrow_back,
                          text: "",
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
