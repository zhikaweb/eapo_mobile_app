import 'package:eapo_mobile_app/presentation/icons.dart';
import 'package:eapo_mobile_app/utils/myWebview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../presentation/customBottomAppBar.dart';

class Contacts extends StatefulWidget {

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final _url = 'https://www.eapo.org/ru/contacts.html?mode=m';
  int _currentIndex = 1;

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
          selectedUrl: Uri.parse(_url).toString(),
        ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)
            ),
            child: CustomBottomAppBar(
              color: Colors.black,
              backgroundColor: Color.fromRGBO(121, 175, 208, 1.0),
              selectedColor: Colors.black,
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
                CustomBottomAppBarItem(iconData: Image(
                  image: AssetImage("assets/images/home.png"),
                )),
                CustomBottomAppBarItem(iconData: _currentIndex == 1 ? Image(
                  image: AssetImage("assets/images/eye_active.png"),
                ) : Image(
                  image: AssetImage("assets/images/eye.png"),
                )),
                CustomBottomAppBarItem(iconData: Image(
                  image: AssetImage("assets/images/atom.png"),
                )),
                CustomBottomAppBarItem(iconData: Image(
                  image: AssetImage("assets/images/game.png"),
                )),
                CustomBottomAppBarItem(iconData: Image(
                  image: AssetImage("assets/images/pill.png"),
                )),
                CustomBottomAppBarItem(iconData: Image(
                  image: AssetImage("assets/images/key.png"),
                ))
              ],
            ),
          )
      ),
    );
  }
}
