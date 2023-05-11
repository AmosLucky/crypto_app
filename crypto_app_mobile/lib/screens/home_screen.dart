import 'package:crypto_app_mobile/constants/assets.dart';
import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/constants/currentuser.dart';
import 'package:crypto_app_mobile/constants/dimensions.dart';
import 'package:crypto_app_mobile/models/coin_model.dart';
import 'package:crypto_app_mobile/repos/account_manager.dart';
import 'package:crypto_app_mobile/screens/coin_details.dart';
import 'package:crypto_app_mobile/screens/profile_screen.dart';
import 'package:crypto_app_mobile/screens/receive_screen.dart';
import 'package:crypto_app_mobile/widget/single_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../repos/general.dart';
import '../repos/utils.dart';
import '../widget/app_title.dart';
import '../widget/circular_action.dart';
import '../widget/coins_search_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AccountManager accountManager = context.watch<AccountManager>();
    GeneralRepo generalRepo = context.watch<GeneralRepo>();
    // accountManager.refreshUser(accountManager.userModel.id);
    return Scaffold(
        backgroundColor: Colors.indigo.shade900,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.indigo.shade600,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              height: getSize(context).height * 0.4,
              width: getSize(context).width,
              decoration: BoxDecoration(color: deepIndego),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTitle(
                        textColor: whiteColor,
                        fontSize: 20,
                      ),
                      IconButton(
                          onPressed: () {
                            // print("gggg");
                            accountManager.updateCoins();
                            //generalRepo.setPageIndex(2);
                            // GeneralRepo()
                            //     .navigateToScreen(context, ProfileSceen());
                          },
                          icon: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Center(
                  child: Column(children: [
                    Text(
                      "Total balance",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BoldText(
                        textColor: whiteColor,
                        fontSize: 30,
                        text: makeCurrency(accountManager.userModel.balance)),
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
                            showCoins(context, "send");
                          },
                        ),
                        CircularAction(
                          iconData: Icons.arrow_downward,
                          text: "Recieve",
                          onTap: () {
                            showCoins(context, "receive");
                          },
                        ),
                        CircularAction(
                          iconData: Icons.balance,
                          text: "Coins",
                          onTap: () {
                            showCoins(context, "receive");
                          },
                        )
                      ],
                    )
                  ]),
                )
              ]),
            ),
            Container(
              //height: 500,
              margin: EdgeInsets.only(top: getSize(context).height * 0.3),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: getSize(context).width,
              decoration: BoxDecoration(
                color: lightIndego,
                //color: Colors.red,
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),

              child: RefreshIndicator(
                onRefresh: () async {
                  accountManager.refreshUser(accountManager.userModel.id);
                  accountManager.updateCoins();
                },
                child: ListView.builder(
                    itemCount: accountManager.userModel.coins.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => CoinDetails(
                                  coinModel: CoinModel.fromJson(
                                      accountManager.userModel.coins[index])));
                          Navigator.push(context, route);
                        },
                        child: SingleCoin(
                            coinModel: CoinModel.fromJson(
                                accountManager.userModel.coins[index])),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
