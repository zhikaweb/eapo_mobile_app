import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List listUrl = ['https://www.facebook.com/eapo.official',
    'https://www.youtube.com/channel/UCPzUFvo897pAnXjU1H06POA',
    'https://twitter.com/EAPO_official'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxHeight > 700) {
            return _buildWideContainers();
          } else {
            return _buildNormalContainer();
          }
        },
      ),
    );
  }

  // iPhone 7
  Widget _buildNormalContainer() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [new Color.fromRGBO(30, 111, 165, 1.0),
                new Color.fromRGBO(209, 231, 243, 1.0)]
          )
      ),
      child: Scaffold(
          appBar: new AppBar(
              primary: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0
                ),
                child: Image(
                    image: AssetImage('assets/images/logo_main.png'),
                    fit: BoxFit.fill
                ),
              ),
              backgroundColor: new Color.fromRGBO(30, 111, 165, 1.0)
          ),
          body: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 10,
                    left: 6,
                    right: 6,
                    bottom: 0
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/menuEapo');
                          },
                          child: Image(
                              image: AssetImage('assets/images/o_eapv.png'),
                              fit: BoxFit.fitWidth
                          ),
                        ),
                        TextButton(
                          onPressed: () {  },
                          child: Image(
                              image: AssetImage('assets/images/emptygear.png'),
                              fit: BoxFit.fitWidth
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0, -20, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/menuInvents');
                                  },
                                  child: Image(
                                      image: AssetImage('assets/images/izobretenie.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -20, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/menuDesigns');
                                  },
                                  child: Image(
                                      image: AssetImage('assets/images/promobrazcy.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0, -40, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/pharma');
                                  },
                                  child: Image(
                                      image: AssetImage('assets/images/farmreestr.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -40, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                  },
                                  child: Image(
                                      image: AssetImage('assets/images/lichny_cab.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0, -60, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {  },
                                  child: Image(
                                      color: Colors.transparent,
                                      image: AssetImage('assets/images/emptygear.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -60, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {  },
                                  child: Image(
                                      image: AssetImage('assets/images/emptygear.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0, -120, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () { _launchUrl(listUrl[0]); },
                                  child: Image(
                                      image: AssetImage('assets/images/facebook.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -120, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () { _launchUrl(listUrl[1]); },
                                  child: Image(
                                      image: AssetImage('assets/images/youtube.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -120, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () { _launchUrl(listUrl[2]); },
                                  child: Image(
                                      image: AssetImage('assets/images/twitter.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ),
          backgroundColor: Colors.transparent
      ),
    );
  }

  // iPhone 12 pro
  Widget _buildWideContainers() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [new Color.fromRGBO(30, 111, 165, 1.0),
                new Color.fromRGBO(209, 231, 243, 1.0)]
          )
      ),
      child: Scaffold(
          appBar: new AppBar(
              primary: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 0
                ),
                child: Image(
                    image: AssetImage('assets/images/logo_main.png'),
                    fit: BoxFit.fill
                ),
              ),
              backgroundColor: new Color.fromRGBO(30, 111, 165, 1.0)
          ),
          body: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 40,
                    left: 15,
                    right: 15,
                    bottom: 0
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/menuEapo');
                          },
                          child: Image(
                              image: AssetImage('assets/images/o_eapv.png'),
                              fit: BoxFit.fitWidth
                          ),
                        ),
                        TextButton(
                          onPressed: () {  },
                          child: Image(
                              image: AssetImage('assets/images/emptygear.png'),
                              fit: BoxFit.fitWidth
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0, -20, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/menuInvents');
                                  },
                                  child: Image(
                                      image: AssetImage('assets/images/izobretenie.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -20, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/menuDesigns');
                                  },
                                  child: Image(
                                      image: AssetImage('assets/images/promobrazcy.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0, -40, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/pharma');
                                  },
                                  child: Image(
                                      image: AssetImage('assets/images/farmreestr.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -40, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Image(
                                      image: AssetImage('assets/images/lichny_cab.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0, -60, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {  },
                                  child: Image(
                                      color: Colors.transparent,
                                      image: AssetImage('assets/images/emptygear.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -60, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {  },
                                  child: Image(
                                      image: AssetImage('assets/images/emptygear.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0, 0, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () { _launchUrl(listUrl[0]); },
                                  child: Image(
                                      image: AssetImage('assets/images/facebook.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, 0, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () { _launchUrl(listUrl[1]); },
                                  child: Image(
                                      image: AssetImage('assets/images/youtube.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, 0, 0),
                          child: Row(
                              children: [
                                TextButton(
                                  onPressed: () { _launchUrl(listUrl[2]); },
                                  child: Image(
                                      image: AssetImage('assets/images/twitter.png'),
                                      fit: BoxFit.fitWidth
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ),
          backgroundColor: Colors.transparent
      ),
    );
  }

  void _launchUrl(String url) async =>
      await canLaunch(Uri.encodeFull(url)) ? await launch(Uri.encodeFull(url)) : throw 'Could not launch $url';
}
