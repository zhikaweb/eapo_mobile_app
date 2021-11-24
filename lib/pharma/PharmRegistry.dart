import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/customCircularProgressIndicator.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:enough_convert/enough_convert.dart';
import 'dart:developer' as developer;

class PharmRegistry extends StatefulWidget {
  @override
  _PharmRegistryState createState() => _PharmRegistryState();
}

class _PharmRegistryState extends State<PharmRegistry> {
  String _url = 'https://www.eapo.org/ru/mobile/sfarma.php';
  String _urlSearch =
      'https://www.eapo.org/ru/mobile/sfarma.php?SEARCH%5Bfarma%5D=';
  late String _searchRequest;

  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  late InAppWebViewController _controller;
  bool isLoading = true;

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
            backgroundColor: Color.fromRGBO(30, 111, 165, 1.0),
            title: Text('ФАРМРЕЕСТР'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/home');
              },
            ),
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
                    margin:
                        EdgeInsets.only(bottom: 0, top: 70, left: 0, right: 0),
                    child: _webView(),
                  ),
                  isLoading ? Center(child: CustomCircularProgressIndicator(),) : Stack(),
                ],
              ),
            ],
          ),
          bottomNavigationBar: _bottomBar(4),
      ),
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
              height: 50,
              child: _materialTextFieldSearch(),
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
          child: Text('Поиск'),
          onPressed: () {
            _search();
          }),
    );
  }

  Material _materialTextFieldSearch() {
    return Material(
      child: TextFormField(
        controller: _textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        showCursor: true,
        onSaved: (value) {
          _searchRequest = value!;
        },
      ),
    );
  }

  Widget _webView() {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(_url)),
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

  ClipRRect _bottomBar(int index){
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0)),
      child: CustomBottomAppBarImpl(currentIndex: index,),
    );
  }

  void _search() {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      final codec = const Windows1251Codec(allowInvalid: false);
      final encoded = codec.encode(_searchRequest);

      var data = Uri.dataFromBytes(encoded, mimeType: '', percentEncoded: true);
      print(data.data!.contentText);
      var encodedData = data.data!.contentText;

      _controller.loadUrl(
          urlRequest: URLRequest(url: Uri.parse(_urlSearch + encodedData)));
    }
  }
}
