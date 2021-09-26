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
        width: 390,
        height: 844,

        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 810,
                  left: 0,
                  child: Container(
                      width: 390,
                      height: 34,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(209, 231, 243, 1),
                      )
                  )
              ),Positioned(
                  top: 34,
                  left: 0,
                  child: Container(
                      width: 390,
                      height: 766,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(30, 111, 165, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 24,
                                left: 0,
                                child: Container(
                                    width: 390,
                                    height: 702,
                                    decoration: BoxDecoration(
                                      gradient : LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(30, 111, 165, 1),
                                            Color.fromRGBO(209, 231, 243, 1)
                                          ]
                                      ),
                                    )
                                )
                            ),Positioned(
                                top: 84,
                                left: -22,
                                child: Container(
                                  decoration: BoxDecoration(

                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,

                                    children: <Widget>[Container(
                                      decoration: BoxDecoration(

                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,

                                        children: <Widget>[
                                          Container(
                                            width: 73.33333587646484,
                                            height: 140,
                                            decoration: BoxDecoration(

                                            ),
                                          ), SizedBox(width : 0),
                                          Container(
                                            width: 73.33333587646484,
                                            height: 140,
                                            decoration: BoxDecoration(

                                            ),
                                          ), SizedBox(width : 0),
                                          Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(
                                              ),
                                              child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: <Widget>[
                                                    Positioned(
                                                      top: -1,
                                                      left: -34,
                                                      child: FlatButton(
                                                        padding: EdgeInsets.all(0),
                                                        onPressed: () {
                                                          Navigator.of(context).pushNamed('/menuEapo');
                                                        },
                                                        child: Image(
                                                          image: AssetImage('assets/images/o_eapv.png'),
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                              )
                                          ), SizedBox(width : 0),
                                          Container(
                                            width: 73.33333587646484,
                                            height: 140,
                                            decoration: BoxDecoration(

                                            ),
                                          ), SizedBox(width : 0),
                                          Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                              child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: <Widget>[
                                                    Positioned(
                                                        top: -1,
                                                        left: -34,
                                                        child: Image(
                                                          image: AssetImage('assets/images/emptygear.png'),
                                                        )
                                                    ),
                                                  ]
                                              )
                                          ), SizedBox(width : 0),
                                          Container(
                                            width: 73.33333587646484,
                                            height: 140,
                                            decoration: BoxDecoration(

                                            ),
                                          ),

                                        ],
                                      ),
                                    ), SizedBox(height : 0),
                                      Container(
                                        decoration: BoxDecoration(

                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,

                                          children: <Widget>[
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                        top: -1,
                                                        left: -34,
                                                        child: FlatButton(
                                                          padding: EdgeInsets.all(0),
                                                          onPressed: () {
                                                            Navigator.of(context).pushNamed('/menuInvents');
                                                          },
                                                          child: Image(
                                                            image: AssetImage('assets/images/izobretenie.png'),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                        top: -1,
                                                        left: -34,
                                                        child: FlatButton(
                                                          padding: EdgeInsets.all(0),
                                                          onPressed: () {
                                                            Navigator.of(context).pushNamed('/menuDesigns');
                                                          },
                                                          child: Image(
                                                            image: AssetImage('assets/images/promobrazcy.png'),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ),

                                          ],
                                        ),
                                      ), SizedBox(height : 0),
                                      Container(
                                        decoration: BoxDecoration(

                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,

                                          children: <Widget>[
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                          top: -1,
                                                          left: -34,
                                                          child: Image(
                                                            image: AssetImage('assets/images/emptygear.png'),
                                                          )
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                        top: -1,
                                                        left: -34,
                                                        child:
                                                        FlatButton(
                                                          padding: EdgeInsets.all(0),
                                                          onPressed: () {
                                                            Navigator.of(context).pushNamed('/pharma');
                                                          },
                                                          child: Image(
                                                            image: AssetImage('assets/images/farmreestr.png'),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                          top: -1,
                                                          left: -34,
                                                          child: Image(
                                                            image: AssetImage('assets/images/lichny_cab.png'),
                                                          )
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ),

                                          ],
                                        ),
                                      ), SizedBox(height : 0),
                                      Container(
                                        decoration: BoxDecoration(

                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,

                                          children: <Widget>[
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                          top: -1,
                                                          left: -34,
                                                          child: Image(
                                                            image: AssetImage('assets/images/emptygear.png'),
                                                          )
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),Positioned(
                                top: 568,
                                left: 91,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow : [BoxShadow(
                                        color: Color.fromRGBO(255, 255, 255, 0.4000000059604645),
                                        offset: Offset(0,0),
                                        blurRadius: 16
                                    )],
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,

                                    children: <Widget>[
                                      Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color : Colors.transparent,
                                          ),
                                          child: Stack(
                                              children: <Widget>[
                                                Positioned(
                                                  top: 4.0000104904174805,
                                                  left: -16,
                                                  child: FlatButton(
                                                    padding: EdgeInsets.all(0),
                                                    onPressed: () {
                                                      _launchUrl(listUrl[0]);
                                                    },
                                                    child: Image(
                                                      image: AssetImage('assets/images/facebook.png'),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          )
                                      ), SizedBox(width : 24),
                                      Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color : Colors.transparent,
                                          ),
                                          child: Stack(
                                              children: <Widget>[
                                                Positioned(
                                                  top: 4,
                                                  left: -16,
                                                  child: FlatButton(
                                                    padding: EdgeInsets.all(0),
                                                    onPressed: () {
                                                      _launchUrl(listUrl[1]);
                                                    },
                                                    child: Image(
                                                      image: AssetImage('assets/images/youtube.png'),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          )
                                      ), SizedBox(width : 24),
                                      Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color : Colors.transparent,
                                          ),
                                          child: Stack(
                                              children: <Widget>[
                                                Positioned(
                                                  top: 4,
                                                  left: -16,
                                                  child: FlatButton(
                                                    padding: EdgeInsets.all(0),
                                                    onPressed: () {
                                                      _launchUrl(listUrl[2]);
                                                    },
                                                    child: Image(
                                                      image: AssetImage('assets/images/twitter.png'),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          )
                                      ),

                                    ],
                                  ),
                                )
                            ),Positioned(
                                top: -10,
                                left: 0,
                                child: Image(
                                  image: AssetImage('assets/images/logo_main.png'),
                                )
                            ),
                          ]
                      )
                  )
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 390,
                      height: 44,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(30, 111, 165, 1),
                      )
                  )
              ),
            ]
        )
    );
  }

  // iPhone 12 pro
  Widget _buildWideContainers() {
    return Container(
        width: 390,
        height: 844,

        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 810,
                  left: 0,
                  child: Container(
                      width: 390,
                      height: 34,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(209, 231, 243, 1),
                      )
                  )
              ),Positioned(
                  top: 44,
                  left: 0,
                  child: Container(
                      width: 390,
                      height: 766,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(30, 111, 165, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 64,
                                left: 0,
                                child: Container(
                                    width: 390,
                                    height: 702,
                                    decoration: BoxDecoration(
                                      gradient : LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(30, 111, 165, 1),
                                            Color.fromRGBO(209, 231, 243, 1)
                                          ]
                                      ),
                                    )
                                )
                            ),Positioned(
                                top: 164,
                                left: -22,
                                child: Container(
                                  decoration: BoxDecoration(

                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,

                                    children: <Widget>[Container(
                                      decoration: BoxDecoration(

                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,

                                        children: <Widget>[
                                          Container(
                                            width: 73.33333587646484,
                                            height: 140,
                                            decoration: BoxDecoration(

                                            ),
                                          ), SizedBox(width : 0),
                                          Container(
                                            width: 73.33333587646484,
                                            height: 140,
                                            decoration: BoxDecoration(

                                            ),
                                          ), SizedBox(width : 0),
                                          Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(
                                              ),
                                              child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: <Widget>[
                                                    Positioned(
                                                      top: -1,
                                                      left: -34,
                                                      child: FlatButton(
                                                        padding: EdgeInsets.all(0),
                                                        onPressed: () {
                                                          Navigator.of(context).pushNamed('/menuEapo');
                                                        },
                                                        child: Image(
                                                          image: AssetImage('assets/images/o_eapv.png'),
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                              )
                                          ), SizedBox(width : 0),
                                          Container(
                                            width: 73.33333587646484,
                                            height: 140,
                                            decoration: BoxDecoration(

                                            ),
                                          ), SizedBox(width : 0),
                                          Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                              child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: <Widget>[
                                                    Positioned(
                                                        top: -1,
                                                        left: -34,
                                                        child: Image(
                                                          image: AssetImage('assets/images/emptygear.png'),
                                                        )
                                                    ),
                                                  ]
                                              )
                                          ), SizedBox(width : 0),
                                          Container(
                                            width: 73.33333587646484,
                                            height: 140,
                                            decoration: BoxDecoration(

                                            ),
                                          ),

                                        ],
                                      ),
                                    ), SizedBox(height : 0),
                                      Container(
                                        decoration: BoxDecoration(

                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,

                                          children: <Widget>[
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                        top: -1,
                                                        left: -34,
                                                        child: FlatButton(
                                                          padding: EdgeInsets.all(0),
                                                          onPressed: () {
                                                            Navigator.of(context).pushNamed('/menuInvents');
                                                          },
                                                          child: Image(
                                                            image: AssetImage('assets/images/izobretenie.png'),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                        top: -1,
                                                        left: -34,
                                                        child: FlatButton(
                                                          padding: EdgeInsets.all(0),
                                                          onPressed: () {
                                                            Navigator.of(context).pushNamed('/menuDesigns');
                                                          },
                                                          child: Image(
                                                            image: AssetImage('assets/images/promobrazcy.png'),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ),

                                          ],
                                        ),
                                      ), SizedBox(height : 0),
                                      Container(
                                        decoration: BoxDecoration(

                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,

                                          children: <Widget>[
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                          top: -1,
                                                          left: -34,
                                                          child: Image(
                                                            image: AssetImage('assets/images/emptygear.png'),
                                                          )
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                        top: -1,
                                                        left: -34,
                                                        child:
                                                        FlatButton(
                                                          padding: EdgeInsets.all(0),
                                                          onPressed: () {
                                                            Navigator.of(context).pushNamed('/pharma');
                                                          },
                                                          child: Image(
                                                            image: AssetImage('assets/images/farmreestr.png'),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                          top: -1,
                                                          left: -34,
                                                          child: Image(
                                                            image: AssetImage('assets/images/lichny_cab.png'),
                                                          )
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ),

                                          ],
                                        ),
                                      ), SizedBox(height : 0),
                                      Container(
                                        decoration: BoxDecoration(

                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,

                                          children: <Widget>[
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
                                                decoration: BoxDecoration(

                                                ),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                          top: -1,
                                                          left: -34,
                                                          child: Image(
                                                            image: AssetImage('assets/images/emptygear.png'),
                                                          )
                                                      ),
                                                    ]
                                                )
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ), SizedBox(width : 0),
                                            Container(
                                              width: 73.33333587646484,
                                              height: 140,
                                              decoration: BoxDecoration(

                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),Positioned(
                                top: 718,
                                left: 91,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow : [BoxShadow(
                                        color: Color.fromRGBO(255, 255, 255, 0.4000000059604645),
                                        offset: Offset(0,0),
                                        blurRadius: 16
                                    )],
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,

                                    children: <Widget>[
                                      Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color : Colors.transparent,
                                          ),
                                          child: Stack(
                                              children: <Widget>[
                                                Positioned(
                                                  top: 4.0000104904174805,
                                                  left: -16,
                                                  child: FlatButton(
                                                    padding: EdgeInsets.all(0),
                                                    onPressed: () {
                                                      _launchUrl(listUrl[0]);
                                                    },
                                                    child: Image(
                                                      image: AssetImage('assets/images/facebook.png'),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          )
                                      ), SizedBox(width : 24),
                                      Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color : Colors.transparent,
                                          ),
                                          child: Stack(
                                              children: <Widget>[
                                                Positioned(
                                                  top: 4,
                                                  left: -16,
                                                  child: FlatButton(
                                                    padding: EdgeInsets.all(0),
                                                    onPressed: () {
                                                      _launchUrl(listUrl[1]);
                                                    },
                                                    child: Image(
                                                      image: AssetImage('assets/images/youtube.png'),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          )
                                      ), SizedBox(width : 24),
                                      Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color : Colors.transparent,
                                          ),
                                          child: Stack(
                                              children: <Widget>[
                                                Positioned(
                                                  top: 4,
                                                  left: -16,
                                                  child: FlatButton(
                                                    padding: EdgeInsets.all(0),
                                                    onPressed: () {
                                                      _launchUrl(listUrl[2]);
                                                    },
                                                    child: Image(
                                                      image: AssetImage('assets/images/twitter.png'),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          )
                                      ),

                                    ],
                                  ),
                                )
                            ),Positioned(
                                top: -10,
                                left: 0,
                                child: Image(
                                  image: AssetImage('assets/images/logo_main.png'),
                                )
                            ),
                          ]
                      )
                  )
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 390,
                      height: 44,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(30, 111, 165, 1),
                      )
                  )
              ),
            ]
        )
    );
  }

  void _launchUrl(String url) async =>
      await canLaunch(Uri.encodeFull(url)) ? await launch(Uri.encodeFull(url)) : throw 'Could not launch $url';
}
