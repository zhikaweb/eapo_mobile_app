import 'dart:io';

import 'package:eapo_mobile_app/utils/icons.dart';
import 'package:eapo_mobile_app/utils/myWebview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/customBottomAppBar.dart';

class PharmRegistry extends StatefulWidget {
  @override
  _PharmRegistryState createState() => _PharmRegistryState();
}

class _PharmRegistryState extends State<PharmRegistry> {
  final _url = 'https://www.eapo.org/ru/mobile/sfarma.php';
  late String _searchRequest;

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
          title: Text('Фармреестр'),
        ),
        body: Container(
          height: 600,
          child: Column(
            children: [
              Form(
                child: Container(
                  height: 100,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (value) {
                          this._searchRequest = value!;
                          print(this._searchRequest);
                        },
                        decoration: InputDecoration(
                          hintText: 'VAR'
                        ),
                      ),
                      ElevatedButton(
                        child: Text('Поиск'),
                        onPressed: () {
                          print('valid');
                        }
                      ),
                    ],
                  ),
                )
              ),
              new SizedBox(
                height: 400.0,
                width: 400.0,
                child:
                InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse(_url)),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomAppBar(
          color: Colors.white,
          backgroundColor: Color.fromRGBO(121, 175, 208, 1.0),
          selectedColor: Colors.white,
//          notchedShape: null,
//          onTabSelected: _onTapped,
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
}
