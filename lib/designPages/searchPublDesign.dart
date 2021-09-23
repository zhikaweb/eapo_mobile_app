import 'package:eapo_mobile_app/presentation/icons.dart';
import 'package:eapo_mobile_app/utils/myWebview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../presentation/customBottomAppBar.dart';

class SearchPublDesign extends StatefulWidget {

  @override
  _SearchPublDesignState createState() => _SearchPublDesignState();
}

class _SearchPublDesignState extends State<SearchPublDesign> {
  final _url = 'https://www.eapo.org/ru/mobile/publicat.php';
  int _currentIndex = 0;

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
          title: "ПРОМОБРАЗЦЫ",
          selectedUrl: Uri.parse(_url).toString(),
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
