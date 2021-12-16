import 'dart:io';
import 'dart:developer' as developer;
import 'dart:convert' as convert;

import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/model/prolongation.dart';
import 'package:eapo_mobile_app/presentation/appDropdownInput.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/dropdownButton.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/dateFormatter.dart';
import 'package:eapo_mobile_app/utils/httpUtils.dart';
import 'package:eapo_mobile_app/utils/networkService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentPSR extends StatefulWidget {
  final String? externalNumAppli;
  const PaymentPSR({Key? key, required this.externalNumAppli}) : super(key: key);

  @override
  _PaymentPSRState createState() => _PaymentPSRState();
}

class _PaymentPSRState extends State<PaymentPSR> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _dateEditingController = TextEditingController();
  GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _paymentFormKey = GlobalKey<FormState>();
  Credentials _credentials = new Credentials();
  late Prolongation _prolongation;
  late String dropdownValue;
  var _appNum;
  List descLetters = [];
  Map<String, dynamic> monthPayments = new Map();
  bool isLoading = false;

  @override
  void initState() {
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
              title: Text('ПРОДЛЕНИЕ СРОКА ОТВЕТА'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
                        _searchForm(),
                        SizedBox(height: 20,),
                        _paymentForm(),
                      ],
                    ),
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

  Form _paymentForm(){
    return Form(
        key: _paymentFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppDropdownInput(items: descLetters,),
            SizedBox(height: 20,),
            AppDropdownButton(monthPayments: monthPayments),
            SizedBox(height: 20,),
            Container(
              child: Text("Дата продления",
                style: TextStyle(color: MainColors().eapoColorMain, fontSize: 18),
              ),
            ),
            Material(
              child: TextFormField(
                controller: _dateEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusColor: MainColors().eapoColorMain,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(8.0),
                  color: MainColors().eapoColorMain,
                  child: MaterialButton(
                      minWidth: 120,
                      height: 60,
                      onPressed: () {
                        _showAlertDialog(context, 'Данные успешно отправлены!', '');
                      },
                      child: Text(
                        "Отправить",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }

  Form _searchForm() {
    return Form(
        key: _searchFormKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 0, top: 0, bottom: 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Номер заявки', style: TextStyle(
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
          child: Text('Показать', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
          onPressed: () {
            _submitForm();
          }),
    );
  }

  TextFormField _materialTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
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

  void _submitForm(){
    if (_searchFormKey.currentState!.validate()) {
      _searchFormKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      _getData();
    } else {
      developer.log("Form is not valid!");
    }
  }

  _getData() {
    var json;
    try {
      _getDataFromBackend().then((response) {
        if (response.statusCode == 200){
          developer.log(response.body);
          json = convert.json.decode(response.body);
           setState(() {
             isLoading = false;
             descLetters = [];
             monthPayments.clear();
             _dateEditingController.clear();
           });
          _prolongation = new Prolongation.fromJson(json);
          descLetters.add(_prolongation.corresp!.descletter ?? "");
          monthPayments = _prolongation.monthPayments!;
          _dateEditingController.text = _prolongation.corresp!.dtlimit ?? "";
          developer.log(_prolongation.corresp!.descletter ?? "");
        } else {
          _showAlertDialog(context, 'Просмотр данных невозможен', 'Заявка не найдена или нет прав доступа');
          developer.log('status code : ' + response.statusCode.toString());
        }
      });
    } catch (e) {
      throw new Exception(e);
    }
  }

  Future<http.Response> _getDataFromBackend() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _credentials.login = (prefs.getString('login') ?? '');
      _credentials.password = (prefs.getString('pass') ?? '');
    });
    print(_credentials.login);

    String url = HttpUtils.mainUrl + 'proxy/psr/info?extidappli=';

    return await http.get(Uri.parse(url + _appNum), headers: {
      HttpHeaders.authorizationHeader: NetworkService(_credentials)
          .calculateAuthentication(),
      },
    );
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
