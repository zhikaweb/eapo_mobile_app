import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:eapo_mobile_app/presentation/icons.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../utils/myWebview.dart';
import '../presentation/customBottomAppBar.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final _url = "https://www.eapo.org/ru/about.html?mode=m";
  int _currentIndex = 0;

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
          selectedUrl: Uri.encodeFull(_url),
        ),
        bottomNavigationBar: CustomBottomAppBar(
          color: Colors.white,
          backgroundColor: Color.fromRGBO(121, 175, 208, 1.0),
          selectedColor: Colors.white,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: (value) {
            final routes = ["/home", "/menuEapo", "/menuInvents", "/menuDesigns", "/pharma"];
            _currentIndex = value;
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //     routes[value], (route) => false);
            if (value == 0){
              Navigator.of(context).pushNamedAndRemoveUntil(
                  routes[value], (route) => false);
            }
            if (value == 1){
              Navigator.of(context).pushNamed('/menuEapo');
            }
            if (value == 2){
              Navigator.of(context).pushNamed('/menuInvents');
            }
            if (value == 3){
              Navigator.of(context).pushNamed('/menuDesigns');
            }
            if (value == 4){
              Navigator.of(context).pushNamed('/pharma');
            }
          },
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
