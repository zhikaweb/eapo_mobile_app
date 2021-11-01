import 'package:flutter/material.dart';

class BtnMainMenu extends StatefulWidget {
  final String title;
  final String route;
  const BtnMainMenu({ Key? key,
    required this.title, required this.route}): super(key: key);

  @override
  _BtnMainMenuState createState() => _BtnMainMenuState();
}

class _BtnMainMenuState extends State<BtnMainMenu> {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: Color.fromRGBO(233, 241, 245, 1.0),
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Navigator.of(context).pushNamed(widget.route);
            },
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 111, 165, 1.0)),
            )
        )
    );
  }
}


