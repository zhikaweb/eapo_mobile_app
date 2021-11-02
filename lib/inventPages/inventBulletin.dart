import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/icons.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/myWebview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../presentation/customBottomAppBar.dart';

class InventBulletin extends StatefulWidget {

  @override
  _InventBulletinState createState() => _InventBulletinState();
}

class _InventBulletinState extends State<InventBulletin> {
  final _url = 'https://www.eapo.org/ru/?publs=bulletin&amp;mode=m';

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
        bottomNavigationBar: _bottomBar(2),
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
