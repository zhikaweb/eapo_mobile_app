import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:eapo_mobile_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../utils/myWebview.dart';
import '../utils/customBottomAppBar.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final _url = "https://www.eapo.org/ru/about.html?mode=m";

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(209, 231, 243, 1.0),
                Color.fromRGBO(209, 231, 243, 1.0)
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: MyWebView(
          title: "О ЕАПВ",
          // selectedUrl: _url,
          selectedUrl: Uri.encodeFull(_url),
          // selectedUrl: "http://google.com",
        ),
        bottomNavigationBar: CustomBottomAppBar(
          color: Colors.white,
          backgroundColor: Color.fromRGBO(121, 175, 208, 1.0),
          selectedColor: Colors.white,
//          notchedShape: null,
//          onTabSelected: _onTapped,
          items: [
            CustomBottomAppBarItem(iconData: MyFlutterApp.home),
            CustomBottomAppBarItem(iconData: MyFlutterApp.eye),
            CustomBottomAppBarItem(iconData: MyFlutterApp.invents),
            CustomBottomAppBarItem(iconData: MyFlutterApp.designs),
            CustomBottomAppBarItem(iconData: MyFlutterApp.pharma),
            CustomBottomAppBarItem(iconData: MyFlutterApp.key)
          ],
        ),
      ),
    );
  }
}
