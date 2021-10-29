class Credentials {
  var _login;
  var _password;

  String get login => _login;

  set login(String value) {
    _login = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  Credentials(this._login, this._password);
}