import 'dart:async';

import 'package:eapo_mobile_app/presentation/customCircularProgressIndicator.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  final String title;
  final String selectedUrl;

  final userAgent =
      'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

  const MyWebView({Key? key,
    required this.title,
    required this.selectedUrl,
  }) : super(key: key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late WebViewController controllerGlobal;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {

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
            title: Text(widget.title),
          ),
          body: Stack(
            children: [
              WebView(
                initialUrl: widget.selectedUrl,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  controllerGlobal = webViewController;
                },
                userAgent: widget.userAgent,
                onPageStarted: (String url) {
                  developer.log('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  developer.log('Page finished loading: $url');
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              isLoading ? Center( child: CustomCircularProgressIndicator(),)
                  : Stack(),
            ],
          )
      ),
      onWillPop: () =>
          _exitApp(context),
    );
  }
}
