import 'package:flutter/cupertino.dart';

class MainColors {

  final LinearGradient _mainLinearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(30, 111, 165, 1.0),
        Color.fromRGBO(209, 231, 243, 1.0)
      ]
  );

  final LinearGradient _innerPageGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(189, 218, 234, 1.0),
        Color.fromRGBO(189, 218, 234, 1.0)
      ]
  );

  final Color _eapoColorMain = Color.fromRGBO(30, 111, 165, 1.0);

  final Color _eapoInnerMenuColor = Color.fromRGBO(189, 218, 234, 1.0);

  final Color _bottomBarColor = Color.fromRGBO(121, 175, 208, 1.0);

  LinearGradient get mainLinearGradient => _mainLinearGradient;

  LinearGradient get innerPageGradient => _innerPageGradient;

  Color get eapoColorMain => _eapoColorMain;

  Color get eapoInnerMenuColor => _eapoInnerMenuColor;

  Color get bottomBarColor => _bottomBarColor;
}