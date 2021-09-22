import 'package:eapo_mobile_app/inner_menu/menuDesigns.dart';
import 'package:eapo_mobile_app/inner_menu/menuEapv.dart';
import 'package:eapo_mobile_app/inner_menu/menuInvents.dart';
import 'package:eapo_mobile_app/pharma/PharmRegistry.dart';
import 'package:eapo_mobile_app/presentation/icons.dart';
import 'package:flutter/material.dart';

class CustomNavigation extends StatefulWidget {

  @override
  _CustomNavigationState createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(MyFlutterApp.eye),
          title: Text(''),
        ),
        BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.invents),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(MyFlutterApp.designs),
          title: Text(''),
        )
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState!.pushReplacementNamed("menuEapo");
        break;
      case 1:
        _navigatorKey.currentState!.pushReplacementNamed("menuInvents");
        break;
      case 2:
        _navigatorKey.currentState!.pushReplacementNamed("menuDesigns");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "menuEapo":
        return MaterialPageRoute(builder: (context) => MenuEAPVScreen());
      case "menuInvents":
        return MaterialPageRoute(builder: (context) => MenuInvents());
      case "menuDesigns":
        return MaterialPageRoute(builder: (context) => MenuDesigns());
      default:
        return MaterialPageRoute(builder: (context) => PharmRegistry());
    }
  }
}