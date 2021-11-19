import 'dart:collection';
import 'dart:io';
import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:eapo_mobile_app/model/application.dart';
import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/dateFormatter.dart';
import 'package:eapo_mobile_app/utils/httpUtils.dart';
import 'package:eapo_mobile_app/utils/networkService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // late Future<Application> application;

  Credentials _credentials = new Credentials();

  Application _application = Application.a();
  late Application application;

  late String _appNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Column(
                children: <Widget>[
                  _form(),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Номер заявки'),
                      SizedBox(width: 10,),
                      Text(_application.eapoRegNo == null ? '' : _application.eapoRegNo.toString()),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Наименование', textAlign: TextAlign.start,),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Text(
                          _application.name == null ? '' : _application.name.toString(),
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Дата'),
                      SizedBox(width: 10,),
                      Text(
                        _application.eapoRegDate == null ? ''
                            : DateFormatter().formatDate(_application.eapoRegDate),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Эксперт'),
                      SizedBox(width: 10,),
                      Text(_application.expert == null ? ''
                          : _application.expert.toString()),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Статус'),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Text(_application.statusName == null ? ''
                            : _application.statusName.toString()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // FutureBuilder<Application>(
            //   future: _getData(),
            //   builder: (context, snapshot){
            //     if (snapshot.hasData){
            //       return Text(snapshot.data!.eapoRegNo.toString());
            //     } else if (snapshot.hasError){
            //       return Text(snapshot.error.toString());
            //     }
            //     return Center(child: CircularProgressIndicator(),);
            //   },
            // ),
            // MaterialButton(
            //   color: MainColors().eapoColorMain,
            //   onPressed: () {
            //     _getData();
            //   },
            //   child: Text('Get data'),
            // ),
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

  Form _form() {
    return Form(
      key: _globalKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            child: SizedBox(
              width: 200,
              child: _materialTextField(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            child: SizedBox(
              width: 120,
              child: _materialBtn(),
            ),
          )
        ],
      ),
    );
  }

  Material _materialBtn() {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(8.0),
      color: Color.fromRGBO(233, 241, 245, 1.0),
      child: MaterialButton(
          child: Text('Показать'),
          onPressed: () {
            _getData();
          }),
    );
  }

  Material _materialTextField() {
    return Material(
      child: TextFormField(
        controller: _textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        showCursor: true,
        validator: (value) {
          if (value == null || value.isEmpty){
            return 'Поле не должно быть пустым';
          } else if (value.length != 9){
            return 'Введите 9-ти значное число!';
          }
        },
        onSaved: (value) {
          _appNum = value!;
        },
      ),
    );
  }

  void _getData(){
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      _credentials.login = 'StalAN';
      _credentials.password = 'ADH563jk';
      // return getApplication(_credentials, _appNum);
      _getDataFromBackend().then<String>((response) {
        if (response.statusCode == 200){
          _createApplicationFromJson(convert.utf8.decode(response.body.codeUnits));
          setState(() {
            _application = application;
          });
          developer.log('application: ' + _application.eapoRegNo.toString());
        } else {
          developer.log('код ответа сервера : ' + response.statusCode.toString());
        }
        throw ('test');
      }).catchError((error) {
        developer.log(error.runtimeType.toString() + ' : ' + error.toString());
      });
    // } else {
    //   throw Exception('Cannot load data');
    }
  }

  Future<http.Response> _getDataFromBackend() async {
    _credentials.login = 'StalAN';
    _credentials.password = 'ADH563jk';

    return await http.get(Uri.parse(HttpUtils.urlAppliInfo + _appNum), headers: {
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

    return application = new Application.fromJson(convert.json.decode(json)['application']);
  }
}
