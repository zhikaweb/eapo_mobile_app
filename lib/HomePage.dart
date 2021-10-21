import 'package:eapo_mobile_app/presentation/screenResolution.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage2 extends StatefulWidget {
  // const HomePage2({Key key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List listUrl = ['https://www.facebook.com/eapo.official',
    'https://www.youtube.com/channel/UCPzUFvo897pAnXjU1H06POA',
    'https://twitter.com/EAPO_official'];

  ScreenResolution screenResolution = new ScreenResolution();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // iPhone 7 (375x667)
          if (constraints.maxWidth > 330 && constraints.maxWidth < 376 && constraints.maxHeight > 700 && constraints.maxHeight < 737) {
            screenResolution.globalContainerWidth = 430;
            screenResolution.globalContainerHeight = 815;
            screenResolution.topPositionGearContainer = 84;
            screenResolution.leftPositionGearContainer = -22;
            screenResolution.topPositionSocialIconContainer = 568;
            screenResolution.leftPositionSocialIconContainer = 91;
            return _buildContainer(
                screenResolution.globalContainerWidth,
                screenResolution.globalContainerHeight,
                screenResolution.topPositionGearContainer,
                screenResolution.leftPositionGearContainer,
                screenResolution.topPositionSocialIconContainer,
                screenResolution.leftPositionSocialIconContainer,
            );
          }
          // iPhone 7+
          if (constraints.maxWidth > 400 && constraints.maxWidth < 415 && constraints.maxHeight > 700 && constraints.maxHeight < 737) {
            screenResolution.globalContainerWidth = 430;
            screenResolution.globalContainerHeight = 815;
            screenResolution.topPositionGearContainer = 84;
            screenResolution.leftPositionGearContainer = -2;
            screenResolution.topPositionSocialIconContainer = 628;
            screenResolution.leftPositionSocialIconContainer = 111;
            return _buildContainer(
                screenResolution.globalContainerWidth,
                screenResolution.globalContainerHeight,
                screenResolution.topPositionGearContainer,
                screenResolution.leftPositionGearContainer,
                screenResolution.topPositionSocialIconContainer,
                screenResolution.leftPositionSocialIconContainer,
            );
          }
          // iPhone 11 pro
          if (constraints.maxWidth > 330 && constraints.maxWidth < 376 &&  constraints.maxHeight > 700 && constraints.maxHeight < 815) {
            screenResolution.globalContainerWidth = 430;
            screenResolution.globalContainerHeight = 844;
            screenResolution.topPositionGearContainer = 134;
            screenResolution.leftPositionGearContainer = -22;
            screenResolution.topPositionSocialIconContainer = 688;
            screenResolution.leftPositionSocialIconContainer = 91;
            return _buildContainer(
              screenResolution.globalContainerWidth,
              screenResolution.globalContainerHeight,
              screenResolution.topPositionGearContainer,
              screenResolution.leftPositionGearContainer,
              screenResolution.topPositionSocialIconContainer,
              screenResolution.leftPositionSocialIconContainer,
            );
          }
          //iPhone 12 pro
          if (constraints.maxWidth > 376 && constraints.maxWidth < 391 &&  constraints.maxHeight > 700 && constraints.maxHeight < 845) {
            screenResolution.globalContainerWidth = 430;
            screenResolution.globalContainerHeight = 850;
            screenResolution.topPositionGearContainer = 134;
            screenResolution.leftPositionGearContainer = -22;
            screenResolution.topPositionSocialIconContainer = 718;
            screenResolution.leftPositionSocialIconContainer = 91;
            return _buildContainer(
              screenResolution.globalContainerWidth,
              screenResolution.globalContainerHeight,
              screenResolution.topPositionGearContainer,
              screenResolution.leftPositionGearContainer,
              screenResolution.topPositionSocialIconContainer,
              screenResolution.leftPositionSocialIconContainer,
            );
          }
          // iPhone 12 pro max
          if (constraints.maxWidth > 391 && constraints.maxWidth < 430 &&  constraints.maxHeight > 800 && constraints.maxHeight < 927) {
            screenResolution.globalContainerWidth = 430;
            screenResolution.globalContainerHeight = 927;
            screenResolution.topPositionGearContainer = 134;
            screenResolution.leftPositionGearContainer = -22;
            screenResolution.topPositionSocialIconContainer = 748;
            screenResolution.leftPositionSocialIconContainer = 91;
            return _buildContainer(
              screenResolution.globalContainerWidth,
              screenResolution.globalContainerHeight,
              screenResolution.topPositionGearContainer,
              screenResolution.leftPositionGearContainer,
              screenResolution.topPositionSocialIconContainer,
              screenResolution.leftPositionSocialIconContainer,
            );
          }
          // iPad
          if (constraints.maxWidth > 700) {
            screenResolution.globalContainerWidth = 2048;
            screenResolution.globalContainerHeight = 2732;
            screenResolution.topPositionGearContainer = 134;
            screenResolution.leftPositionGearContainer = 208;
            screenResolution.topPositionSocialIconContainer = 748;
            screenResolution.leftPositionSocialIconContainer = 321;
            return _buildContainer(
              screenResolution.globalContainerWidth,
              screenResolution.globalContainerHeight,
              screenResolution.topPositionGearContainer,
              screenResolution.leftPositionGearContainer,
              screenResolution.topPositionSocialIconContainer,
              screenResolution.leftPositionSocialIconContainer,
            );
          }
          else {
            screenResolution.globalContainerWidth = 430;
            screenResolution.globalContainerHeight = 815;
            screenResolution.topPositionGearContainer = 84;
            screenResolution.leftPositionGearContainer = -22;
            screenResolution.topPositionSocialIconContainer = 568;
            screenResolution.leftPositionSocialIconContainer = 91;
            return _buildContainer(
              screenResolution.globalContainerWidth,
              screenResolution.globalContainerHeight,
              screenResolution.topPositionGearContainer,
              screenResolution.leftPositionGearContainer,
              screenResolution.topPositionSocialIconContainer,
              screenResolution.leftPositionSocialIconContainer,
            );
          }
        },
      ),
    );
  }

  Widget _buildContainer(double? globalContainerWidth,
      double? globalContainerHeight,
      double? topPositionGearContainer,
      double? leftPositionGearContainer,
      double? topPositionSocialIconContainer,
      double? leftPositionSocialIconContainer,
      ) {
    return Container(
        width: globalContainerWidth,
        height: globalContainerHeight,

        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 810,
                  left: 0,
                  child: Container(
                      width: globalContainerWidth,
                      height: 34,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(209, 231, 243, 1),
                      )
                  )
              ),Positioned(
                  top: 34,
                  left: 0,
                  child: Container(
                      width: globalContainerWidth,
                      height: globalContainerHeight,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(30, 111, 165, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 24,
                                left: 0,
                                child: Container(
                                    width: globalContainerWidth,
                                    height: globalContainerHeight,
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
                                top: screenResolution.topPositionGearContainer,
                                left: screenResolution.leftPositionGearContainer,
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
                                                          child: Image.asset('assets/images/o_eapv.png')
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
                                top: topPositionSocialIconContainer,
                                left: leftPositionSocialIconContainer,
                                child: Container(
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
                      width: 430,
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
