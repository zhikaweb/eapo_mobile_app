import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;

import 'package:eapo_mobile_app/accountPages/applicationInfo.dart';
import 'package:eapo_mobile_app/accountPages/paymentPPS.dart';
import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/model/portalMessage.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/dateFormatter.dart';
import 'package:eapo_mobile_app/utils/httpUtils.dart';
import 'package:eapo_mobile_app/utils/networkService.dart';
import 'package:enough_convert/windows/windows1251.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Credentials _credentials = new Credentials();
  List<PortalMessage> _portalMessages = [];
  final codec = const Windows1251Codec(allowInvalid: false);

  @override
  void initState() {
    _getNotifications();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: MainColors().innerPageGradient,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: MainColors().eapoColorMain,
              title: Text('УВЕДОМЛЕНИЯ'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {Navigator.of(context).pop();},
              )
          ),
          body: Stack(children: <Widget>[
            Container(
            alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/eg_xl.svg'),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset('assets/images/eg_sm_bottomright.svg'),
            ),
            _portalMessages.length == 0 ?
            Center(
              child: Text('Новых уведомлений нет',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MainColors().eapoColorMain
                ),
              ),
            ) :
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: ListView.builder(
                  itemCount: _portalMessages.length > 0 ? _portalMessages.length : 0,
                  itemBuilder: (context, index){
                    return Card(
                      margin: EdgeInsets.only(bottom: 16, top: 0, left: 8, right: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 3.0,
                      child: Container(
                        decoration: new BoxDecoration(
                            gradient: _changeBorderColor(_portalMessages[index].type),
                            borderRadius: new BorderRadius.all(const Radius.circular(8.0))),
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(top: 0, left: 8, bottom: 0, right: 0),
                            child: Text(_portalMessages.length > 0
                                ? '${_portalMessages[index].message}'
                                : ''
                              , style: TextStyle(color: MainColors().eapoColorMain),),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top: 16, left: 8, bottom: 0, right: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(_portalMessages.length > 0
                                    ? 'Заявка №${_portalMessages[index].applicationNumber}'
                                    : '', textAlign: TextAlign.start,
                                ),
                                Text(_portalMessages[index].sendingDate != null
                                    ? '${DateFormatter().formatDate(_portalMessages[index].sendingDate)}'
                                    : '', textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          onTap: (){
                            _goToNotePage(_portalMessages[index].type, _portalMessages[index].applicationNumber);
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ]
          ),
          bottomNavigationBar: _bottomBar(5),
        )
    );
  }

  ClipRRect _bottomBar(int index){
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0)),
      child: CustomBottomAppBarImpl(currentIndex: index,),
    );
  }

  _getNotifications(){
    try {
      _getAllNotes().then((response) => {
        if (response.statusCode == 200) {
          developer.log('response: ' + utf8.decode(response.bodyBytes)),
          setState(() {
            _portalMessages = (convert.json.decode(response.body) as List).map((i) =>
                PortalMessage.fromJson(i)).take(10).toList();
            _portalMessages.sort((a,b) => b.creationDate!.compareTo(a.creationDate ?? DateTime.now()));
          }),
          developer.log('_portalMessage: ' + _portalMessages[0].message.toString()),
        } else {
          developer.log(response.statusCode.toString()),
        }
      });
    } catch (e) {
      throw Exception(e);
    }
}

  Future<http.Response> _getAllNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _credentials.login = (prefs.getString('login') ?? '');
      _credentials.password = (prefs.getString('pass') ?? '');
    });
    String url = HttpUtils.mainUrl + 'mobile/messages';
    return await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: NetworkService(_credentials)
          .calculateAuthentication(),
      HttpHeaders.acceptCharsetHeader: "utf-8"
    });
   }

   _goToNotePage(String? type, String? appNum){
    switch (type) {
      case "PPS":
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PaymentPPS(externalNumAppli: appNum,),
        ),);
        break;
      case "INFO":
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ApplicationInfo(externalNumAppli: appNum,),
        ),);
        break;
    }
   }

   LinearGradient _changeBorderColor(String? type){
     if (type == "PPS") {
       return new LinearGradient(
           stops: [0.03, 0.03],
           colors: [Colors.red, Colors.white]
       );
     } else if (type == "INFO"){
       return new LinearGradient(
           stops: [0.03, 0.03],
           colors: [Colors.green, Colors.white]
       );
     } else {
       return new LinearGradient(
           stops: [0.03, 0.03],
           colors: [Color.fromRGBO(154, 15, 91, 1), Colors.white]
       );
     }
   }

  }