import 'package:eapo_mobile_app/account/loginPage.dart';
import 'package:eapo_mobile_app/homePage.dart';
import 'package:eapo_mobile_app/designPages/designBulletin.dart';
import 'package:eapo_mobile_app/designPages/designDocs.dart';
import 'package:eapo_mobile_app/designPages/searchPublDesign.dart';
import 'package:eapo_mobile_app/inner_menu/menuDesigns.dart';
import 'package:eapo_mobile_app/inner_menu/menuEapv.dart';
import 'package:eapo_mobile_app/inner_menu/menuGetPatent.dart';
import 'package:eapo_mobile_app/inner_menu/menuInvents.dart';
import 'package:eapo_mobile_app/inventPages/inventBulletin.dart';
import 'package:eapo_mobile_app/inventPages/inventDocs.dart';
import 'package:eapo_mobile_app/inventPages/patentRegistry.dart';
import 'package:eapo_mobile_app/inventPages/searchPubl.dart';
import 'package:eapo_mobile_app/pharma/PharmRegistry.dart';
import 'package:eapo_mobile_app/eapoPages/about.dart';
import 'package:eapo_mobile_app/eapoPages/accounts.dart';
import 'package:eapo_mobile_app/eapoPages/contacts.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

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
        '/home': (BuildContext context) => new HomePage(),
        '/menuEapo': (BuildContext context) => new MenuEAPVScreen(),
        '/menuInvents': (BuildContext context) => new MenuInvents(),
        '/menuDesigns': (BuildContext context) => new MenuDesigns(),
        '/pharma': (BuildContext context) => new PharmRegistry(),
        '/about': (BuildContext context) => new About(),
        '/getPatent': (BuildContext context) => new MenuGetPatent(),
        '/accounts': (BuildContext context) => new Accounts(),
        '/contacts': (BuildContext context) => new Contacts(),
        '/inventDocs': (BuildContext context) => new InventDocs(),
        '/inventBull': (BuildContext context) => new InventBulletin(),
        '/patentRegistry': (BuildContext context) => new PatentRegistry(),
        '/searchPubl': (BuildContext context) => new SearchPubl(),
        '/designDocs': (BuildContext context) => new DesignDocs(),
        '/designBull': (BuildContext context) => new DesignBulletin(),
        '/searchPublDesign': (BuildContext context) => new SearchPublDesign(),
        '/login': (BuildContext context) => new LoginPage(),
      },
    );
  }
}

