import 'dart:io';
import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:eapo_mobile_app/model/application.dart';
import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/httpUtils.dart';
import 'package:eapo_mobile_app/utils/networkService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

class ApplicationInfo extends StatefulWidget {
  const ApplicationInfo({Key? key}) : super(key: key);

  @override
  _ApplicationInfoState createState() => _ApplicationInfoState();
}

class _ApplicationInfoState extends State<ApplicationInfo> {

  Credentials _credentials = new Credentials();
  late Application _application;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: MainColors().innerPageGradient,
      ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Color.fromRGBO(30, 111, 165, 1.0),
              title: Text('ИНФОРМАЦИЯ ПО ЗАЯВКЕ'),
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
            // _form(),
            // _applicationInfo(),
            MaterialButton(
              color: MainColors().eapoColorMain,
              onPressed: () {
                _getData();
              },
              child: Text('Get data'),
            ),
          ]),
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



  // Form _form(){
  //
  // }

  void _getData(){
    _getDataFromBackend().then((response) => {
      if (response.statusCode == 200){
          _createApplicationFromJson(convert.utf8.decode(response.body.codeUnits)),
          developer.log('application: ' + _application.eapoRegNo.toString()),
      } else {
        developer.log('код ответа сервера : ' + response.statusCode.toString()),
      }
    }).catchError((error) {
      developer.log(error.toString());
    });
  }

  Future<http.Response> _getDataFromBackend() async {
    _credentials.login = 'StalAN';
    _credentials.password = 'ADH563jk';

    return await http.get(Uri.parse(HttpUtils.urlAppliInfo + '202090011'), headers: {
      HttpHeaders.authorizationHeader: NetworkService(_credentials)
          .calculateAuthentication(),
      },
    );
  }

  Application _createApplicationFromJson(String response){
    Xml2Json xml2json = new Xml2Json();
    var doc = XmlDocument.parse(response).getElement('application').toString();
    developer.log('XmlElement ' + doc);
    xml2json.parse(doc);
    var json = xml2json.toParker();
    developer.log('json: '+ json);
    return _application = new Application.fromJson(convert.json.decode(json)['application']);
  }
}
