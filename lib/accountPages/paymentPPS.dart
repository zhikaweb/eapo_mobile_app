import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/customCircularProgressIndicator.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:developer' as developer;

class PaymentPPS extends StatefulWidget {
  const PaymentPPS({Key? key}) : super(key: key);

  @override
  _PaymentPPSState createState() => _PaymentPPSState();
}

class _PaymentPPSState extends State<PaymentPPS> {
  Credentials _credentials = new Credentials();
  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  var _appNum;
  bool isChecked = true;
  bool isLoading = true;
  late InAppWebViewController _controller;
  String _url = '';

  @override
  void initState() {
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
              title: Text('ИНФОРМАЦИЯ ПО ЗАЯВКЕ'),
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
                    margin: EdgeInsets.only(bottom: 0, top: 70, left: 0, right: 0),
                    child: _url.isEmpty ? Container() : _webView(),
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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
            _loadData();
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
          url: Uri.parse(_url)),
      onWebViewCreated: (controller) {
        _controller = controller;
      },
      onLoadStart: (controller, _url) {
        developer.log('page is loading: ' + _url.toString());
      },
      onLoadStop: (controller, _url){
        developer.log('page is loaded: ' + _url.toString());
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  void _loadData(){
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();

      _controller.loadUrl(
          urlRequest: URLRequest(url: Uri.parse(_url + _appNum)));
    }
  }

  // https://www.eapo.org/ru/patents/reestr/any_request2021.php?rg=pay&mode=m&i21='+ _appNum
}
