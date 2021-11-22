import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:eapo_mobile_app/model/application.dart';
import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/presentation/applicationInfoView.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/dateFormatter.dart';
import 'package:eapo_mobile_app/utils/httpUtils.dart';
import 'package:eapo_mobile_app/utils/networkService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

import 'PDFScreen.dart';

class ApplicationInfo extends StatefulWidget {
  const ApplicationInfo({Key? key}) : super(key: key);

  @override
  _ApplicationInfoState createState() => _ApplicationInfoState();
}

class _ApplicationInfoState extends State<ApplicationInfo> {

  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  Credentials _credentials = new Credentials();
  Application _application = Application.a();
  List<Document> docs = [];
  var application;
  var _appNum;
  String remotePDFpath = '';

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
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: Column(
                children: <Widget>[
                  _form(),
                  SizedBox(height: 10,),
                  ApplicationInfoView(application: _application),
                  SizedBox(height: 20,),
                  Text(_application.documents == null ? '' : 'Документы'),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 320, left: 8, right: 8, bottom: 0),
                  child: ListView.builder(
                      itemCount: _application.documents != null ? docs.length : 0,
                      itemBuilder: (context, index){
                        return Card(
                          child: ListTile(
                            title: Text(_application.documents != null
                                ? '${docs[index].description}'
                                : ''),
                            subtitle: Text(_application.documents != null
                                ? '${DateFormatter().formatDate(docs[index].docDate)}'
                                : '', textAlign: TextAlign.end,
                            ),
                            leading: IconButton(
                              onPressed: () {
                                createFileOfPdfUrl(docs[index].docId, _application.eapoRegNo).then((f) {
                                  setState(() {
                                    remotePDFpath = f.path;
                                  });
                                  if (remotePDFpath.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PDFScreen(path: remotePDFpath),
                                      ),
                                    );
                                  }
                                });
                                // _showPdf(docs[index].docId, _application.eapoRegNo);
                              },
                              iconSize: 30,
                              icon: Icon(Icons.description),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )
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

      _getDataFromBackend().then<String>((response) {
        if (response.statusCode == 200){
          _createApplicationFromJson(convert.utf8.decode(response.body.codeUnits));
          setState(() {
            _application = application;
            docs = _application.documents!.document!
                .where((element) => element.docType == 'OUT' && element.signed == '1')
                .toList();
            docs.sort((a,b) => b.docDate.compareTo(a.docDate));
          });
          developer.log('application: ' + _application.eapoRegNo.toString());
        } else {
          developer.log('код ответа сервера : ' + response.statusCode.toString());
        }
        throw new Exception(response.reasonPhrase);
      }).catchError((error) {
        developer.log(error.runtimeType.toString() + ' : ' + error.toString());
      });
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


  Future<File> createFileOfPdfUrl(String? docId, String? appNum) async {
    Completer<File> completer = Completer();
    _credentials.login = 'StalAN';
    _credentials.password = 'ADH563jk';
    print("Start download pdf");
    try {
      final url = HttpUtils.mainUrl + 'signed/eapoRegNo/' + appNum! + '/docId/' + docId!;
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      request.headers.add(HttpHeaders.authorizationHeader, NetworkService(_credentials)
          .calculateAuthentication());
      var response = await request.close();
      print(response.statusCode);
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception(e);
    }

    return completer.future;
  }
}
