import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BtnInnerMenu extends StatefulWidget {
  final String title;
  final String route;
  const BtnInnerMenu({Key? key,
    required this.title, required this.route}) : super(key: key);

  @override
  _BtnInnerMenuState createState() => _BtnInnerMenuState();
}

class _BtnInnerMenuState extends State<BtnInnerMenu> {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: Color.fromRGBO(233, 241, 245, 1.0),
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            height: 60,
            onPressed: () {
              _launchUrl(widget.route);
            },
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 111, 165, 1.0)),
            )
        )
    );
  }

  void _launchUrl(String url) async =>
      await canLaunch(Uri.encodeFull(url)) ? await launch(Uri.encodeFull(url)) : throw 'Could not launch $url';
}


