import 'package:flutter/cupertino.dart';

class MainColors {

  final LinearGradient mainLinearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(30, 111, 165, 1.0),
        Color.fromRGBO(209, 231, 243, 1.0)
      ]
  );

  final LinearGradient innerPageGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(189, 218, 234, 1.0),
        Color.fromRGBO(189, 218, 234, 1.0)
      ]
  );

  final Color eapoColorMain = Color.fromRGBO(30, 111, 165, 1.0);

  final Color eapoInnerMenuColor = Color.fromRGBO(189, 218, 234, 1.0);

  final Color bottomBarColor = Color.fromRGBO(121, 175, 208, 1.0);

}