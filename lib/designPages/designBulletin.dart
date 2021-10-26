import 'package:eapo_mobile_app/presentation/icons.dart';
import 'package:eapo_mobile_app/utils/myWebview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../presentation/customBottomAppBar.dart';

class DesignBulletin extends StatefulWidget {

  @override
  _DesignBulletinState createState() => _DesignBulletinState();
}

class _DesignBulletinState extends State<DesignBulletin> {
  final _url = 'https://www.eapo.org/ru/?publs=desbull';
  int _currentIndex = 3;

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
          title: "БЮЛЛЕТЕНЬ",
          selectedUrl: Uri.parse(_url).toString(),
        ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)
            ),
            child: CustomBottomAppBar(
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
                // if (value == 3){
                //   Navigator.of(context).pushNamed('/menuDesigns');
                // }
                if (value == 4){
                  Navigator.of(context).pushNamed('/pharma');
                }
              },
              items: [
                CustomBottomAppBarItem(iconData: SvgPicture.asset('assets/images/home.svg')),
                CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/eye.svg")),
                CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/atom.svg")),
                CustomBottomAppBarItem(iconData: _currentIndex == 3
                    ? SvgPicture.asset("assets/images/game_active.svg")
                    : SvgPicture.asset("assets/images/game.svg")),
                CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/pill.svg")),
                CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/key.svg"))
              ],
            ),
          )
      ),
    );
  }
}
