import 'package:crypto_app_mobile/constants/colors.dart';
import 'package:crypto_app_mobile/models/usermodel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../repos/general.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  UserModel userModel;
  DashboardScreen({super.key, required this.userModel});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> pages = [
    HomeScreen(),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    GeneralRepo generalRepo = context.watch<GeneralRepo>();

    return WillPopScope(
      onWillPop: () async {
        return await false;
      },
      child: Scaffold(
        body: Container(child: pages[generalRepo.pageIndex]),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.black.withOpacity(0.2),
          items: <Widget>[
            icon(Icons.home),
            icon(Icons.list),
            icon(Icons.person),
          ],
          onTap: (index) {
            //Handle button tap
            generalRepo.setPageIndex(index);
          },
        ),
      ),
    );
  }

  Widget icon(icondata) {
    return Icon(
      icondata,
      size: 30,
      color: deepIndego,
    );
  }
}
