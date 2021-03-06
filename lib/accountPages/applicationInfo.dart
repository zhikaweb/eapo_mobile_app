import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:eapo_mobile_app/model/application.dart';
import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/presentation/applicationInfoView.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/customCircularProgressIndicator.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

import 'PDFScreen.dart';

class ApplicationInfo extends StatefulWidget {
  final String? externalNumAppli;
  const ApplicationInfo({Key? key, required this.externalNumAppli}) : super(key: key);

  @override
  _ApplicationInfoState createState() => _ApplicationInfoState();
}

class _ApplicationInfoState extends State<ApplicationInfo> {

  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  Credentials _credentials = new Credentials();
  Application _application = Application.a();
  List<Document> docs = [];
  var application;
  var _appNum;
  String remotePDFpath = '';
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    _textEditingController.text = widget.externalNumAppli ?? "";
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
              backgroundColor: MainColors().eapoColorMain,
              title: Text('???????????????????? ???? ????????????'),
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
            Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Column(
                      children: <Widget>[
                        _form(),
                        SizedBox(height: 10,),
                        ApplicationInfoView(application: _application),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(_application.documents == null ? '' : '?????????????????????? ????????',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: MainColors().eapoColorMain,
                              ),
                            ),
                            SizedBox(width: 150,
                              child: Divider(
                                color: _application.documents == null ? Colors.transparent
                                    : MainColors().eapoColorMain,
                                height: 3,
                                thickness: 3,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    child: ListView.builder(
                        itemCount: _application.documents != null ? docs.length : 0,
                        itemBuilder: (context, index){
                          return Card(
                            child: ListTile(
                              title: Text(_application.documents != null
                                  ? '${docs[index].description}'
                                  : ''
                              , style: TextStyle(color: MainColors().eapoColorMain),),
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
                                },
                                iconSize: 30,
                                icon: Icon(Icons.description, color: MainColors().eapoColorMain,),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            // isLoading ? Center(child: CustomCircularProgressIndicator(),) : Stack(),
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
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 0, top: 0, bottom: 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('?????????? ????????????', style: TextStyle(
                  color: MainColors().eapoColorMain, fontSize: 16, fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.horizontal,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                  child: SizedBox(
                    width: 210,
                    // height: 50,
                    child: _materialTextField(),
                  ),
                ),
                flex: 1,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                  // child: _materialBtn(),
                  child: SizedBox(
                    width: 150,
                    height: 55,
                    child: _materialBtn(),
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
        ],
      )
    );
  }

  Material _materialBtn() {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(8.0),
      color: MainColors().eapoColorMain,
      child: MaterialButton(
          child: Text('????????????????', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
          onPressed: () {
            _getData();
          }),
    );
  }

  TextFormField _materialTextField() {
    return TextFormField(
        // keyboardType: TextInputType.number,
        controller: _textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
          errorMaxLines: 2,
          focusColor: MainColors().eapoColorMain,
        ),
        showCursor: true,
        cursorHeight: 26.0,
        // maxLength: 9,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            height: 0.7,
        ),
        validator: (value) {
          if (value == null || value.isEmpty){
            return '???????? ???? ???????????? ???????? ????????????';
          } else if (value.length != 9){
            return '?????????????? 9-???? ?????????????? ??????????!';
          }
        },
        onSaved: (value) {
          _appNum = value!;
        },
    );
  }

  void _getData(){
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      try {
        _getDataFromBackend().then((response) {
          if (response.statusCode == 200){
            _createApplicationFromJson(convert.utf8.decode(response.body.codeUnits));
            setState(() {
              isLoading = false;
              _application = application;
              docs = _application.documents!.document!
                  .where((element) => element.docType == 'OUT' && element.signed == '1')
                  .toList();
              docs.sort((a,b) => b.docDate.compareTo(a.docDate));
            });
            developer.log('application: ' + _application.eapoRegNo.toString());
          } else {
            _showAlertDialog(context, '???????????????? ???????????? ????????????????????', '???????????? ???? ?????????????? ?????? ?????? ???????? ??????????????');
            developer.log('status code : ' + response.statusCode.toString());
          }
        });
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  Future<http.Response> _getDataFromBackend() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _credentials.login = (prefs.getString('login') ?? '');
      _credentials.password = (prefs.getString('pass') ?? '');
    });
    print(_credentials.login);

    String url = HttpUtils.mainUrl + 'application/eapoRegNo/';

    return await http.get(Uri.parse(url + _appNum), headers: {
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _credentials.login = (prefs.getString('login') ?? '');
      _credentials.password = (prefs.getString('pass') ?? '');
    });
    developer.log("Start download pdf");
    try {
      final url = HttpUtils.mainUrl + 'signed/eapoRegNo/' + appNum! + '/docId/' + docId!;
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      request.headers.add(HttpHeaders.authorizationHeader, NetworkService(_credentials)
          .calculateAuthentication());
      var response = await request.close();
      developer.log(response.statusCode.toString());
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      developer.log("Download files");
      developer.log("${dir.path}/$filename.pdf");
      File file = File("${dir.path}/$filename.pdf");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception(e);
    }

    return completer.future;
  }

  _showAlertDialog(BuildContext context, String title, String text) {
    // set up the button
    Widget okButton = TextButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
