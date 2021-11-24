import 'package:flutter/material.dart';

import 'mainColors.dart';

class CustomCircularProgressIndicator extends StatefulWidget {

  @override
  _CustomCircularProgressIndicatorState createState() => _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState extends State<CustomCircularProgressIndicator> with TickerProviderStateMixin{
  late AnimationController animationController;
  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: new Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      // backgroundColor: Colors.black26,
      valueColor: animationController
          .drive(ColorTween(begin: MainColors().eapoColorMain,
          end: MainColors().eapoInnerMenuColor))
    );
  }
}
