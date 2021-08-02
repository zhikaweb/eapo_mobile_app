import 'package:flutter/material.dart';
import 'homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: new Color.fromRGBO(30, 111, 165, 1.0)),
      debugShowCheckedModeBanner: false,
      title: 'EAPO-mobile',
      home: HomePage()
    );
  }
}

