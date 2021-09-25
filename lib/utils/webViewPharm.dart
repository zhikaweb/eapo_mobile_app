import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPharm extends StatelessWidget {
  final String selectedUrl;

  final userAgent =
      'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';


  final Completer<WebViewController> _controller = Completer<WebViewController>();
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

  WebViewPharm({
    required this.selectedUrl
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          body: WebView(
            initialUrl: selectedUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              // _controller.complete(webViewController);
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
