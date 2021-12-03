import 'dart:convert';
import 'dart:io';

import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/customCircularProgressIndicator.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/httpUtils.dart';
import 'package:eapo_mobile_app/utils/networkService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

class PaymentPPS extends StatefulWidget {
  final String? externalNumAppli;
  const PaymentPPS({Key? key, required this.externalNumAppli}) : super(key: key);

  @override
  _PaymentPPSState createState() => _PaymentPPSState();
}

class _PaymentPPSState extends State<PaymentPPS> {
  Credentials _credentials = new Credentials();
  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late InAppWebViewController _controller;

  bool isChecked = true;
  bool isLoading = false;

  var _appNum;

  late Map<String, dynamic> _json;
  late Map<String, dynamic> _annpatfees;

  final String _url = 'https://www.eapo.org/ru/patents/reestr/any_request2021.php?rg=pay&mode=m&i21=';
  final String _idOper = 'PPS';
  final String initialPage = new Uri.dataFromString(
      '<html><body style="background: #BDDAEAFF;"></body></html>',
      mimeType: 'text/html').toString();

  String successPage = new Uri
      .dataFromString('<html><body style="background: #BDDAEAFF; font-size: 100px; padding: 16px;">Данные по заявке успешно поданы!</body></html>',
      mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
      .toString();

  String failedPage = new Uri.dataFromString(
      '<html><body style="background: #BDDAEAFF; font-size: 100px; padding: 16px;">Заявка не найдена или нет прав доступа!</body></html>',
      mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
      .toString();

  @override
  void initState() {
    _textEditingController.text = widget.externalNumAppli!;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
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
              title: Text('УПЛАТА ППС'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {Navigator.of(context).pop();},
              )
          ),
          body: Stack(
            children: <Widget>[
              Container(
                child: _form(),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 0, top: 120, left: 0, right: 0),
                    child: _webView(),
                  ),
                  isLoading ? Center(child: CustomCircularProgressIndicator(),) : Stack(),
                ],
              ),
            ],
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

  Form _form() {
    return Form(
      key: _globalKey,
      child: Column(
        children: <Widget>[
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            direction: Axis.horizontal,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                  child: SizedBox(
                    width: 210,
                    height: 50,
                    child: _materialTextField(),
                  ),
                ),
                flex: 1,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                  child: SizedBox(
                    width: 140,
                    height: 50,
                    child: _materialBtn(),
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _checkbox(),
                Text('Списать с авансового счета',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Material _materialBtn() {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(8.0),
      color: MainColors().eapoColorMain,
      child: MaterialButton(
          child: Text('Показать', style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
          onPressed: () {
            _loadUrl();
          }),
    );
  }

  TextFormField _materialTextField() {
    return TextFormField(
      controller: _textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        labelText: 'Номер заявки',
        floatingLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      showCursor: true,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22
      ),
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
    );
  }

  Checkbox _checkbox(){
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return MainColors().eapoInnerMenuColor;
      }
      return MainColors().eapoColorMain;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
      setState(() {
        isChecked = value!;
      });
      },
    );
  }

  Widget _webView() {

    return InAppWebView(
      initialUrlRequest: URLRequest(
          url: Uri.parse(initialPage)),
      onWebViewCreated: (controller) {
        _controller = controller;
      },
      onLoadStart: (controller, _url) {
        developer.log('page is loading: ' + _url.toString());
        if (_url.toString().contains("pay_request")) {
          _controller.evaluateJavascript(source: "console.log(SendData('***'))");
        }
      },
      onLoadStop: (controller, _url){
        developer.log('page is loaded: ' + _url.toString());
        setState(() {
          isLoading = false;
        });
      },
      onConsoleMessage: (InAppWebViewController controller, ConsoleMessage consoleMessage) {
        developer.log("console message: ${consoleMessage.message}");
        if (consoleMessage.message.isNotEmpty && consoleMessage.message.startsWith('{')) {
          _json = json.decode(consoleMessage.message);
          _json["dossier_number"] = _appNum;

          isChecked ? _annpatfees = { "paymentoption" : "advance-account" }
          : _annpatfees = { "paymentoption" : "payment-document" };
          _annpatfees["annpatfees"] = _json;

          developer.log(_annpatfees.toString());
          _sendPaymentData(_annpatfees);
        }
      },
    );
  }

  _sendPaymentData(Map jsonMap) {
    _sendJsonToBackend(jsonMap).then((response) {
      if (response.statusCode == 200) {
        developer.log("Данные успешно переданы : " + response.body);
        _loadPageOnResponse(successPage);
      } else {
        developer.log('Передача не удалась : ' + response.body);
        _loadPageOnResponse(failedPage);
      }
      throw new Exception(response.reasonPhrase! + " " + response.statusCode.toString());
    }).catchError((error) {
      developer.log(error.runtimeType.toString() + ' : ' + error.toString());
    });
  }

  Future<http.Response> _sendJsonToBackend(Map jsonMap) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _credentials.login = (prefs.getString('login') ?? '');
      _credentials.password = (prefs.getString('pass') ?? '');
    });
    String url = HttpUtils.mainUrl + 'mobile/pps';
    var body = utf8.encode(json.encode(jsonMap));

    return await http.post(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: NetworkService(_credentials)
          .calculateAuthentication(),
      HttpHeaders.contentTypeHeader: "application/json"
      }, body: body
    );
  }

  void _loadUrl(){
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      _checkOperation(_appNum).then((response) {
        if (response.statusCode == 200) {
          developer.log('Заявка принята : ' + response.statusCode.toString());
          _controller.loadUrl(urlRequest: URLRequest(url: Uri.parse(_url + _appNum)));
        } else {
          developer.log('Ошибка : ' + response.statusCode.toString() + ' ' + response.body);
          _loadPageOnResponse(failedPage);
        }
        throw new Exception(response.reasonPhrase);
      }).catchError((error) {
        developer.log(error.runtimeType.toString() + ' : ' + error.toString());
      });
    }
  }

  Future<http.Response> _checkOperation(String appNum) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _credentials.login = (prefs.getString('login') ?? '');
      _credentials.password = (prefs.getString('pass') ?? '');
    });
    String url = HttpUtils.mainUrl + 'mobile/checkoperation?eapoRegNo=$appNum&idoper=$_idOper';
    return await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: NetworkService(_credentials)
          .calculateAuthentication()
      }
    );
  }

  _loadPageOnResponse(String url) {
    _controller.loadUrl(urlRequest: URLRequest(url: Uri.parse(url)));
  }

}
