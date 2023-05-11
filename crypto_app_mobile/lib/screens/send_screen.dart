import 'package:crypto_app_mobile/constants/dimensions.dart';
import 'package:crypto_app_mobile/models/transaction_model.dart';
import 'package:crypto_app_mobile/repos/coin_repo.dart';
import 'package:crypto_app_mobile/repos/general.dart';
import 'package:crypto_app_mobile/repos/transaction_repo.dart';
import 'package:crypto_app_mobile/repos/utils.dart';
import 'package:crypto_app_mobile/widget/circular_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants/colors.dart';
import '../models/coin_model.dart';
import '../repos/account_manager.dart';
import '../widget/app_title.dart';
import '../widget/booton1.dart';
import '../widget/textinputfield.dart';
import 'forgot_pin.dart';

class SendScreen extends StatefulWidget {
  CoinModel coinModel;
  SendScreen({super.key, required this.coinModel});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  var _formKey = GlobalKey<FormState>();
  var _formKey2 = GlobalKey<FormState>();
  TextEditingController addressCTR = new TextEditingController();
  TextEditingController amountCTR = new TextEditingController();
  TextEditingController pinCtr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    CoinRepo coinRepo = context.watch<CoinRepo>();
    AccountManager accountManager = context.watch<AccountManager>();
    TransactionRepo transactionRepo = context.watch<TransactionRepo>();

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
                            // Image.network(
                            //   widget.coinModel.image,
                            //   height: 100,
                            // ),
                            child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(widget.coinModel.image),
                        )),
                        SizedBox(
                          height: 0,
                        ),
                        Text("Balance"),
                        Container(
                          child: BoldText(
                            text: addCommas(widget.coinModel.balance),
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
                          labelText: "Amount in " + widget.coinModel.name,
                          controller: amountCTR,
                          icon: Icons.diamond,
                          textInputType: TextInputType.number,
                          validator: (text) {
                            /// accountManager.inputValidator(text!, "username");
                            if (accountManager.fieldValidator(text!)) {
                              return accountManager.fieldValidatorMsg("Amount");
                            }
                          },
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Visibility(
                            visible: transactionRepo.msg.length > 2,
                            child: Text(transactionRepo.msg),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Visibility(
                                visible: transactionRepo.isLoding,
                                child: CupertinoActivityIndicator())),
                        Button1(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              Alert(
                                context: context,
                                type: AlertType.warning,
                                title: "Alert",
                                desc: "You are about to send \n" +
                                    (amountCTR.text.trim() +
                                        " " +
                                        widget.coinModel.name) +
                                    " to " +
                                    addressCTR.text,
                                content: Form(
                                  key: _formKey2,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextInput(
                                        labelText: "Enter transaction pin",
                                        controller: pinCtr,
                                        icon: Icons.lock,
                                        isPassword: true,
                                        validator: (text) {
                                          /// accountManager.inputValidator(text!, "username");
                                          if (accountManager
                                              .fieldValidator(text!)) {
                                            return accountManager
                                                .fieldValidatorMsg(
                                                    "transaction pin");
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          GeneralRepo().navigateToScreen(
                                              context, ForgetPin());
                                        },
                                        child: Text(
                                          "Forgot transaction pin?",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                style: AlertStyle(
                                    titleStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 17)),
                                buttons: [
                                  DialogButton(
                                    color: primaryColor,
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey2.currentState!.validate()) {
                                        transactionRepo.sendCoin(
                                            userPin: accountManager
                                                .userModel.transaction_pin,
                                            pin: pinCtr.text.trim(),
                                            user_id:
                                                accountManager.userModel.id,
                                            amount: amountCTR.text,
                                            address: addressCTR.text,
                                            coinModel: widget.coinModel);
                                        Navigator.pop(context);
                                      }
                                    },
                                    width: 120,
                                  )
                                ],
                              ).show();
                              // transactionRepo.sendCoin(
                              //     user_id: accountManager.userModel.id,
                              //     amount: amountCTR.text,
                              //     address: addressCTR.text,
                              //     coinModel: widget.coinModel);
                            }
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
                          onTap: () {
                            Navigator.pop(context);
                          },
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
