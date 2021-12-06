import 'package:eapo_mobile_app/accountPages/applicationInfo.dart';
import 'package:eapo_mobile_app/accountPages/loginPage.dart';
import 'package:eapo_mobile_app/accountPages/paymentPPS.dart';
import 'package:eapo_mobile_app/homePage.dart';
import 'package:eapo_mobile_app/designPages/designBulletin.dart';
import 'package:eapo_mobile_app/designPages/designDocs.dart';
import 'package:eapo_mobile_app/designPages/searchPublDesign.dart';
import 'package:eapo_mobile_app/innerMenu/menuDesigns.dart';
import 'package:eapo_mobile_app/innerMenu/menuEapv.dart';
import 'package:eapo_mobile_app/innerMenu/menuGetPatent.dart';
import 'package:eapo_mobile_app/innerMenu/menuInvents.dart';
import 'package:eapo_mobile_app/inventPages/inventBulletin.dart';
import 'package:eapo_mobile_app/inventPages/inventDocs.dart';
import 'package:eapo_mobile_app/inventPages/patentRegistry.dart';
import 'package:eapo_mobile_app/inventPages/searchPubl.dart';
import 'package:eapo_mobile_app/pharma/PharmRegistry.dart';
import 'package:eapo_mobile_app/eapoPages/about.dart';
import 'package:eapo_mobile_app/eapoPages/accounts.dart';
import 'package:eapo_mobile_app/eapoPages/contacts.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'accountPages/notificationPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      theme: ThemeData(primaryColor: new MainColors().eapoColorMain),
      debugShowCheckedModeBanner: false,
      title: 'EAPO-mobile',
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
        '/menuEapo': (BuildContext context) => MenuEAPVScreen(),
        '/menuInvents': (BuildContext context) => MenuInvents(),
        '/menuDesigns': (BuildContext context) => MenuDesigns(),
        '/pharma': (BuildContext context) => PharmRegistry(),
        '/about': (BuildContext context) => About(),
        '/getPatent': (BuildContext context) => MenuGetPatent(),
        '/accounts': (BuildContext context) => Accounts(),
        '/contacts': (BuildContext context) => Contacts(),
        '/inventDocs': (BuildContext context) => InventDocs(),
        '/inventBull': (BuildContext context) => InventBulletin(),
        '/patentRegistry': (BuildContext context) => PatentRegistry(),
        '/searchPubl': (BuildContext context) => SearchPubl(),
        '/designDocs': (BuildContext context) => DesignDocs(),
        '/designBull': (BuildContext context) => DesignBulletin(),
        '/searchPublDesign': (BuildContext context) => SearchPublDesign(),
        '/login': (BuildContext context) => LoginPage(),
        '/applicationInfo': (BuildContext context) => ApplicationInfo(externalNumAppli: ''),
        '/paymentPPS': (BuildContext context) => PaymentPPS(externalNumAppli: '',),
        '/notifications': (BuildContext context) => NotificationPage(),
      },
    );
  }
}

