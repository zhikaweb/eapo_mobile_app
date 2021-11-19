import 'dart:io';
import 'package:eapo_mobile_app/utils/networkService.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:flutter/material.dart';
import 'package:eapo_mobile_app/utils/httpUtils.dart';

class LoadPdf extends StatefulWidget {
  final String? docId;
  final String? appNum;
  
  const LoadPdf({Key? key, required this.docId, required this.appNum }) : super(key: key);

  @override
  _LoadPdfState createState() => _LoadPdfState();
}

class _LoadPdfState extends State<LoadPdf> {

  Credentials _credentials = new Credentials();

  @override
  void initState() {
    // TODO: implement initState
    getPdf(widget.docId, widget.appNum);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  getPdf(String? docId, String? appNum){
    var bytes;

    _getDataFromBackend(docId, appNum).then((response) => {
      if (response.statusCode == 200){
        print(response.body),
        print(response.runtimeType),
        bytes = response.bodyBytes,
      } else {
        throw new Exception(response.reasonPhrase),
    }
    });
  }

  Future<http.Response> _getDataFromBackend(docId, appNum) async {
    _credentials.login = 'StalAN';
    _credentials.password = 'ADH563jk';

    return await http.get(
      Uri.parse(HttpUtils.mainUrl + 'signed/eapoRegNo/' + appNum + '/docId/' + docId),
      headers: {HttpHeaders.authorizationHeader: NetworkService(_credentials)
          .calculateAuthentication(),
      },
    );
  }
}
