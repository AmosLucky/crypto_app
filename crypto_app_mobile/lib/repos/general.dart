import 'package:flutter/material.dart';

class GeneralRepo extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  navigateToScreen(BuildContext context, Widget child) {
    var route = MaterialPageRoute(builder: (BuildContext) => child);
    Navigator.push(context, route);
  }

  navigateToScreen2(Widget child) {
    var route = MaterialPageRoute(builder: (BuildContext) => child);
    navigatorKey.currentState!.push(route);
  }

  setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
