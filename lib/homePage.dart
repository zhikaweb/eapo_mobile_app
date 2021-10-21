import 'package:eapo_mobile_app/presentation/screenResolution.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  // const HomePage2({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List listUrl = ['https://www.facebook.com/eapo.official',
    'https://www.youtube.com/channel/UCPzUFvo897pAnXjU1H06POA',
    'https://twitter.com/EAPO_official'];


  List routeNames = ['/menuEapo', '/menuInvents', '/menuDesigns', '/pharma'];
  List imagePaths = ['assets/images/emptygear.png',
    'assets/images/o_eapv.png',
    'assets/images/izobretenie.png',
    'assets/images/promobrazcy.png',
    'assets/images/farmreestr.png',
    'assets/images/lichny_cab.png'];

  List socialIconsPaths = ['assets/images/facebook.png',
    'assets/images/youtube.png', 'assets/images/twitter.png'];

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
              ),
              Positioned(
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
                            ),
                            Positioned(
                                top: screenResolution.topPositionGearContainer,
                                left: screenResolution.leftPositionGearContainer,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            constrainedContainerWithGearBtn(routeNames[0], imagePaths[1]),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            constrainedContainerWithEmptyGear(imagePaths[0]),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height : 0),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            constrainedContainerWithGearBtn(routeNames[1], imagePaths[2]),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            constrainedContainerWithGearBtn(routeNames[2], imagePaths[3]),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height : 0),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            constrainedContainerWithEmptyGear(imagePaths[0]),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            constrainedContainerWithGearBtn(routeNames[3], imagePaths[4]),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            Container(
                                                width: 73.33333587646484,
                                                height: 140,
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
                                            ),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height : 0),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            constrainedContainerWithEmptyGear(imagePaths[0]),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                            SizedBox(width : 0),
                                            emptyConstrainedContainer(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                            Positioned(
                                top: topPositionSocialIconContainer,
                                left: leftPositionSocialIconContainer,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      containerWithStackAndSocialBtn(socialIconsPaths[0], listUrl[0]),
                                      SizedBox(width : 24),
                                      containerWithStackAndSocialBtn(socialIconsPaths[1], listUrl[1]),
                                      SizedBox(width : 24),
                                      containerWithStackAndSocialBtn(socialIconsPaths[2], listUrl[2]),
                                    ],
                                  ),
                                )
                            ),
                            Positioned(
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

  Widget containerWithStackAndSocialBtn(String iconPath, String socialURL){
    return Container(
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
                  child: socialBtn(iconPath, socialURL)
              ),
            ]
        )
    );
  }

  Widget socialBtn(String iconPath, String socialURL){
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        _launchUrl(socialURL);
      },
      child: Image(
        image: AssetImage(iconPath),
      ),
    );
  }

  Widget emptyConstrainedContainer(){
    return Container(
      width: 73.33333587646484,
      height: 140,
    );
  }

  Widget constrainedContainerWithEmptyGear(String imageRoute){
    return Container(
        width: 73.33333587646484,
        height: 140,
        child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                  top: -1,
                  left: -34,
                  child: Image(
                    image: AssetImage(imageRoute),
                  )
              ),
            ]
        )
    );
  }

  Widget constrainedContainerWithGearBtn(String routeName, String imagePath){
    return Container(
        width: 73.33333587646484,
        height: 140,
        child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                  top: -1,
                  left: -34,
                  child: gearBtn(routeName, imagePath)
              ),
            ]
        )
    );
  }


  Widget gearBtn(String routeName, String imagePath){
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Image(
        image: AssetImage(imagePath),
      ),
    );
  }

  void _launchUrl(String url) async =>
      await canLaunch(Uri.encodeFull(url)) ? await launch(Uri.encodeFull(url)) : throw 'Could not launch $url';
}
