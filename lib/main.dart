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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'accountPages/notificationPage.dart';
import 'accountPages/paymentPSR.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FlutterAppBadger.updateBadgeCount(1);

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    FlutterAppBadger.updateBadgeCount(1);

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

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
        '/paymentPSR': (BuildContext context) => PaymentPSR(externalNumAppli: '',),
        '/notifications': (BuildContext context) => NotificationPage(),
      },
    );
  }
}




