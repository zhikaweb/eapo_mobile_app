import 'dart:convert';
import 'dart:typed_data';

import 'package:eapo_mobile_app/model/credentials.dart';

class NetworkService {
  final Credentials credentials;

  NetworkService(this.credentials);

  String calculateAuthentication() {
    List<int> prefix = utf8.encode(credentials.login + ":");
    // print(prefix);
    List<int> pass = utf8.encode(credentials.password);
    // print(pass);
    List<int> usernamePass = [];
    usernamePass.addAll(prefix);
    usernamePass.addAll(pass);
    // print(usernamePass);
    List.copyRange(prefix, 0, usernamePass, 0, prefix.length);
    List.copyRange(pass, 0, usernamePass, 0, pass.length);
    return 'Basic ' + base64.encode(usernamePass);
  }
}