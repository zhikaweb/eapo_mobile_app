import 'dart:async';
import 'dart:convert';

import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final userAgent =
      'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

  MyWebView({
    required this.title,
    required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {

    late WebViewController controllerGlobal;

    Future<bool> _exitApp(BuildContext context) async{
      if (await controllerGlobal.canGoBack()) {
        print('goBack');
        controllerGlobal.goBack();
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    }

    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: MainColors().eapoColorMain,
              title: Text(title),
            ),
            body: WebView(
              initialUrl: selectedUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                controllerGlobal = webViewController;
              },
              userAgent: userAgent,
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
              },
            )
        ),
        onWillPop: () =>
          _exitApp(context),
    );
  }
}