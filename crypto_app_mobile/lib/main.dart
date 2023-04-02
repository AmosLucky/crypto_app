import 'package:crypto_app_mobile/constants/strings.dart';
import 'package:crypto_app_mobile/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repos/account_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccountManager()),
      ],
      child: MaterialApp(
        title: appName,
        theme: ThemeData(
          fontFamily: "raleway",
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
