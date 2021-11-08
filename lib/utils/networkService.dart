import 'dart:convert';

import 'package:eapo_mobile_app/model/credentials.dart';

class NetworkService {
  final Credentials credentials;

  NetworkService(this.credentials);

  String calculateAuthentication() {
    List<int> prefix = utf8.encode(credentials.login + ":");
    List<int> pass = utf8.encode(credentials.password);
    List<int> usernamePass = prefix + pass;
    List.copyRange(prefix, 0, usernamePass, 0, prefix.length);
    List.copyRange(pass, 0, usernamePass, prefix.length, pass.length);
    return 'Basic ' + base64.encode(usernamePass);
  }
}