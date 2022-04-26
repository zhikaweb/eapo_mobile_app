import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/presentation/screenResolution.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

import 'accountPages/accountMenu.dart';
import 'accountPages/notificationPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List listUrl = ['https://www.facebook.com/eapo.official',
    'https://www.youtube.com/channel/UCPzUFvo897pAnXjU1H06POA',
    'https://twitter.com/EAPO_official', 'https://t.me/eapveapo'];


  List routeNames = ['/menuEapo', '/menuInvents', '/menuDesigns', '/pharma', '/login'];
  List imagePaths = ['assets/images/emptygear.svg',
    'assets/images/eapo.svg',
    'assets/images/izo.svg',
    'assets/images/promo.svg',
    'assets/images/pharm.svg',
    'assets/images/lk.svg'];

  List socialIconsPaths = ['assets/images/fb.svg',
    'assets/images/ut.svg', 'assets/images/twt.svg', 'assets/images/telegram.svg'];

  late String _login;
  late String _userName;

  ScreenResolution screenResolution = new ScreenResolution();

  @override
  void initState() {
    super.initState();
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // iPhone 7 (375x667)
          if (constraints.maxWidth > 330 && constraints.maxWidth < 376 && constraints.maxHeight > 700 && constraints.maxHeight < 737) {
            screenResolution.globalContainerWidth = 375;
            screenResolution.globalContainerHeight = 815;
            screenResolution.topPositionGearContainer = 84;
            screenResolution.leftPositionGearContainer = -22;
            screenResolution.topPositionSocialIconContainer = 568;
            screenResolution.leftPositionSocialIconContainer = 65;
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
            screenResolution.leftPositionSocialIconContainer = 85;
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
            screenResolution.leftPositionGearContainer = -32;
            screenResolution.topPositionSocialIconContainer = 688;
            screenResolution.leftPositionSocialIconContainer = 65;
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
            screenResolution.leftPositionSocialIconContainer = 65;
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
            screenResolution.leftPositionSocialIconContainer = 65;
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
            screenResolution.leftPositionSocialIconContainer = 295;
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
            screenResolution.leftPositionSocialIconContainer = 65;
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
                  top: 34,
                  left: 0,
                  child: Container(
                      width: globalContainerWidth,
                      height: globalContainerHeight,
                      decoration: BoxDecoration(
                        color : MainColors().eapoColorMain,
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
                                      gradient : MainColors().mainLinearGradient,
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
                                            constrainedContainerWithGearBtn(routeNames[4], imagePaths[5]),
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
                                      SizedBox(width : 24),
                                      containerWithStackAndSocialBtn(socialIconsPaths[3], listUrl[3]),
                                    ],
                                  ),
                                )
                            ),
                            Positioned(
                                top: 15,
                                left: 10,
                                child: SvgPicture.asset('assets/images/logo_main.svg'),
                            ),
                          ]
                      )
                  )
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: globalContainerWidth,
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
                  top: 0,
                  left: -20,
                  child: socialBtn(iconPath, socialURL)
              ),
            ]
        )
    );
  }

  Widget socialBtn(String iconPath, String socialURL){
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        _launchUrl(socialURL);
      },
      child: SvgPicture.asset(iconPath),
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
                  child: SvgPicture.asset(imageRoute)
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
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          this._login = (prefs.getString('login') ?? '');
          this._userName = (prefs.getString('portalUserName') ?? '');
        });
        if (routeName.startsWith('/login')){
          if (this._login.isNotEmpty && this._userName.isNotEmpty){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => AccountMenu(portalUsername: this._userName,)
            ));
          } else{
            Navigator.of(context).pushNamed(routeName);
          }
        } else {
          Navigator.of(context).pushNamed(routeName);
        }
      },
      child: SvgPicture.asset(imagePath)
      );
  }

  void _launchUrl(String url) async =>
      await canLaunch(Uri.encodeFull(url)) ? await launch(Uri.encodeFull(url)) : throw 'Could not launch $url';

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    print("initialMessage: " + initialMessage.toString());

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    FlutterAppBadger.removeBadge();
    if (message.data.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => NotificationPage()
      ));
    }
  }
}
