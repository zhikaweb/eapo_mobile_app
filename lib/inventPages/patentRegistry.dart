import 'package:eapo_mobile_app/utils/icons.dart';
import 'package:eapo_mobile_app/utils/myWebview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/customBottomAppBar.dart';

class PatentRegistry extends StatefulWidget {
  @override
  _PatentRegistryState createState() => _PatentRegistryState();
}

class _PatentRegistryState extends State<PatentRegistry> {
  final _url = 'https://www.eapo.org/ru/mobile/reestr.php';

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
          title: "Изобретения",
          selectedUrl: Uri.parse(_url).toString(),
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
