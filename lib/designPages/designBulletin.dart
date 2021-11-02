import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/myWebview.dart';
import 'package:flutter/material.dart';

class DesignBulletin extends StatefulWidget {

  @override
  _DesignBulletinState createState() => _DesignBulletinState();
}

class _DesignBulletinState extends State<DesignBulletin> {
  final _url = 'https://www.eapo.org/ru/?publs=desbull';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: MainColors().innerPageGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: MyWebView(
          title: "БЮЛЛЕТЕНЬ",
          selectedUrl: Uri.parse(_url).toString(),
        ),
        bottomNavigationBar: _bottomBar(3),
      ),
    );
  }

  ClipRRect _bottomBar(int index){
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0)),
      child: CustomBottomAppBarImpl(currentIndex: index,),
    );
  }
}
