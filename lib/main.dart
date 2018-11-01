import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_store/blocs/bloc_provider.dart';
import 'package:online_store/screens/home/home.dart';
import 'package:online_store/screens/cart/cart.dart';
import 'package:online_store/screens/login/login.dart';
import 'package:online_store/screens/splash/splash.dart';

main() {
  runApp(new App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final ThemeData androidTheme = new ThemeData(
      fontFamily: 'is',
      accentColor: Colors.black45,
      primaryColor: Colors.green);

  @override
  Widget build(BuildContext context) {
    return new BlocProvider(
      child: new MaterialApp(
        title: 'آسا',
        theme: androidTheme,
        initialRoute: '/',
        routes: <String, Widget Function(BuildContext)>{
          '/': (context) => SplashScreen(),
          '/home': (context) => Home(),
          '/login': (context) => Login(),
          '/cart': (context) => Cart(),
        },
      ),
    );
  }
}
