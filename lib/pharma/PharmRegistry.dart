import 'dart:convert';
import 'dart:io';

import 'package:eapo_mobile_app/presentation/icons.dart';
import 'package:eapo_mobile_app/utils/myWebview.dart';
import 'package:eapo_mobile_app/utils/webViewPharm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:windows1251/windows1251.dart';
import 'package:enough_convert/enough_convert.dart';

import '../presentation/customBottomAppBar.dart';

class PharmRegistry extends StatefulWidget {
  @override
  _PharmRegistryState createState() => _PharmRegistryState();
}

class _PharmRegistryState extends State<PharmRegistry> {
  String _url = 'https://www.eapo.org/ru/mobile/sfarma.php';
  String _urlSearch = 'https://www.eapo.org/ru/mobile/sfarma.php?SEARCH%5Bfarma%5D=';
  late String _searchRequest;
  int _currentIndex = 0;
  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  late InAppWebViewController _controller;

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
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(209, 231, 243, 1.0),
                Color.fromRGBO(209, 231, 243, 1.0)
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('ФАРМРЕЕСТР'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/home');
            },
          ),
        ),
        body: Column(
            children: [
              Column(
                children: [
                  Container(
                      child: Form(
                        key: _globalKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 0,
                                right: 0,
                                top: 10,
                                bottom: 10,
                              ),
                              child: SizedBox(
                                width: 200,
                                height: 40,
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 0,
                                right: 0,
                                top: 10,
                                bottom: 10,
                              ),
                              child: SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                    child: Text('Поиск'),
                                    onPressed: () {
                                      _search();
                                    }
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                  Container(
                    height: 500,
                    padding: EdgeInsets.all(5),
                    child: InAppWebView(
                      initialUrlRequest: URLRequest(url: Uri.parse(_url)),
                      onWebViewCreated: (controller) {
                        _controller = controller;
                      },
                    ),
                  )
                ],
              ),
            ]
        ),
        bottomNavigationBar: CustomBottomAppBar(
          color: Colors.white,
          backgroundColor: Color.fromRGBO(121, 175, 208, 1.0),
          selectedColor: Colors.white,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: (value) {
            final routes = [
              "/home",
              "/menuEapo",
              "/menuInvents",
              "/menuDesigns",
              "/pharma"
            ];
            _currentIndex = value;
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //     routes[value], (route) => false);
            if (value == 0) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  routes[value], (route) => false);
            }
            if (value == 1) {
              Navigator.of(context).pushNamed('/menuEapo');
            }
            if (value == 2) {
              Navigator.of(context).pushNamed('/menuInvents');
            }
            if (value == 3) {
              Navigator.of(context).pushNamed('/menuDesigns');
            }
            // if (value == 4){
            //   Navigator.of(context).pushNamed('/pharma');
            // }
          },
          items: [
            CustomBottomAppBarItem(iconData: MyFlutterApp.home),
            CustomBottomAppBarItem(iconData: MyFlutterApp.eye),
            CustomBottomAppBarItem(iconData: MyFlutterApp.invents),
            CustomBottomAppBarItem(iconData: MyFlutterApp.designs),
            CustomBottomAppBarItem(iconData: MyFlutterApp.pharma),
            CustomBottomAppBarItem(iconData: MyFlutterApp.key)
          ],
        ),
      ),
    );
  }

  void _search() {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      // print(_searchRequest);
      final codec = const Windows1251Codec(allowInvalid: false);
      final encoded = codec.encode(_searchRequest);
      // print(encoded);
      // print(Uri.dataFromBytes(encoded, mimeType: '', percentEncoded: true));

      var data = Uri.dataFromBytes(encoded, mimeType: '', percentEncoded: true);
      print(data.data!.contentText);
      var encodedData = data.data!.contentText;

      _controller.loadUrl(
          urlRequest: URLRequest(url: Uri.parse(_urlSearch + encodedData)));
      // print(Uri.parse(_urlSearch + encodedData));
    }
  }

}
