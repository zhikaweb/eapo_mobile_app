import 'package:eapo_mobile_app/accountPages/accountMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'customBottomAppBar.dart';


class CustomBottomAppBarImpl extends StatefulWidget {
  final int currentIndex;
  const CustomBottomAppBarImpl({Key? key,
    required this.currentIndex}) : super(key: key);

  @override
  _CustomBottomAppBarImplState createState() => _CustomBottomAppBarImplState();
}

class _CustomBottomAppBarImplState extends State<CustomBottomAppBarImpl> {
  late String _login;
  late String _portalUserName;

  @override
  Widget build(BuildContext context) {

    return CustomBottomAppBar(
      backgroundColor: Color.fromRGBO(121, 175, 208, 1.0),
      notchedShape: CircularNotchedRectangle(),
      onTabSelected: (value) {
        // widget.currentIndex = value;
        switch (value) {
          case 0:
            Navigator.of(context).pushNamed('/home');
            break;
          case 1:
            Navigator.of(context).pushNamed('/menuEapo');
            break;
          case 2:
            Navigator.of(context).pushNamed('/menuInvents');
            break;
          case 3:
            Navigator.of(context).pushNamed('/menuDesigns');
            break;
          case 4:
            Navigator.of(context).pushNamed('/pharma');
            break;
          case 5:
            checkLogin();
            // Navigator.of(context).pushNamed('/login');
            break;
        }
      },
      items: [
        CustomBottomAppBarItem(
            iconData: widget.currentIndex == 0
                ? SvgPicture.asset("assets/images/home_active.svg")
                : SvgPicture.asset("assets/images/home.svg")),
        CustomBottomAppBarItem(
            iconData: widget.currentIndex == 1
                ? SvgPicture.asset("assets/images/eye_active.svg")
                : SvgPicture.asset("assets/images/eye.svg")),
        CustomBottomAppBarItem(
            iconData: widget.currentIndex == 2
                ? SvgPicture.asset("assets/images/atom_active.svg")
                : SvgPicture.asset("assets/images/atom.svg")),
        CustomBottomAppBarItem(
            iconData: widget.currentIndex == 3
                ? SvgPicture.asset("assets/images/game_active.svg")
                : SvgPicture.asset("assets/images/game.svg")),
        CustomBottomAppBarItem(
            iconData: widget.currentIndex == 4
                ? SvgPicture.asset("assets/images/pill_active.svg")
                : SvgPicture.asset("assets/images/pill.svg")),
        CustomBottomAppBarItem(
            iconData: widget.currentIndex == 5
                ? SvgPicture.asset("assets/images/key_active.svg")
                : SvgPicture.asset("assets/images/key.svg")),
      ],
    );
  }

  Future<void> checkLogin() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      this._login = (prefs.getString('login') ?? '');
      this._portalUserName = (prefs.getString('portalUserName') ?? '');
    });
    print(this._login);
    if (this._login.isNotEmpty && this._portalUserName.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => AccountMenu(portalUsername: this._portalUserName,)
      ));
    } else {
      Navigator.of(context).pushNamed('/login');
    }
  }
}

