import 'dart:convert' as convert;
import 'dart:io';
import 'dart:developer' as developer;

import 'package:eapo_mobile_app/accountPages/accountMenu.dart';
import 'package:eapo_mobile_app/main.dart';
import 'package:eapo_mobile_app/model/portalUser.dart';
import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/httpUtils.dart';
import 'package:eapo_mobile_app/utils/networkService.dart';
import 'package:eapo_mobile_app/utils/pushNotificationsManager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Credentials _credentials = new Credentials();
  late PortalUser _portalUser;
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  String? _token = "";

  @override
  void initState() {
    // TODO: implement initState
    PushNotificationsManager manager = new PushNotificationsManager();
    manager.init();
    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: MainColors().mainLinearGradient,
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(30, 111, 165, 1.0),
              title: Text('ЛИЧНЫЙ КАБИНЕТ'),
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
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset('assets/images/eg_lg_top_r.svg'),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset('assets/images/eg_sm_bottomleft.svg'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: _loginForm(),
                ),
              ],
            ),
          bottomNavigationBar: _bottomBar(5),
        )
    );
  }

  Form _loginForm(){
    return Form(
        key: _globalKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8, right: 0, top: 0, bottom: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Логин', style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          ),
          _inputLogin(),
          SizedBox(height: 32,),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 0, top: 0, bottom: 8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Пароль', style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          ),
          _inputPassword(),
          SizedBox(height: 32,),
          _btnSubmit(),
          SizedBox(height: 32,),
          SizedBox(width: 200, child: _divider(),),
          SizedBox(height: 32,),
          // _btnNewUser(),
        ],
      ),
    );
  }

  Material _inputLogin(){
    return Material(
        child: TextFormField(
            controller: _loginController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.clear_outlined), onPressed: () {
                _loginController.clear();
              },
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Имя пользователя',
              hintStyle: TextStyle(fontSize: 18),
              fillColor: Colors.white,
              filled: true,
            ),
            validator: (value) {
              if (value == null || value == '') {
                return 'Please enter login';
              }
              return null;
            },
            onSaved: (value) async {
              _credentials.login = value!;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                prefs.setString('login', _credentials.login);
              });
            }
        )
    );
  }

  Material _inputPassword(){
    return Material(
      child: TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
          ),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: 'Пароль',
          hintStyle: TextStyle(fontSize: 18),
          fillColor: Colors.white,
          filled: true,
        ),
        obscureText: _hidePassword,
        validator: (value) {
          if (value == null || value == '') {
            return 'Please enter password';
          }
          return null;
        },
        onSaved: (value) async {
          _credentials.password = value!;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          setState(() {
            prefs.setString('pass', _credentials.password);
          });
        }
    ),
    );
  }

  Material _btnSubmit(){
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: MainColors().eapoColorMain,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            height: 60,
            onPressed: () async {
              _submitForm();
            },
            child: Text(
              'Войти',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
        )
    );
  }

  Material _btnNewUser(){
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: MainColors().eapoColorMain,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            height: 60,
            onPressed: () {
              _showAlertDialog(context, 'Регистрация в приложении недоступна', 'Обратитесь в ЕАПВ');
            },
            child: Text(
              'Новый пользователь',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
        )
    );
  }

  Material _divider(){
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(2.0),
      child: Divider(color: Colors.white, height: 2,),
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

  _submitForm() {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      developer.log('Form is valid!');
      _loadData();
    } else {
      print('Form is not valid!');
    }
  }

  _loadData() {
    var json;
    try {
      _checkAuthentication().then((response) => {
        if (response.statusCode == 200) {
          developer.log('response: ' + response.body),
          json = convert.json.decode(response.body),
          developer.log("Sending token..."),
          _sendToken().then((value) {
            if (value.statusCode == 200) {
              developer.log(value.statusCode.toString() + " token received, creating PortalUser...");
              _portalUser = new PortalUser.fromJson(json);
              developer.log('PortalUser is: ' + _portalUser.fullUserName.toString());
              _saveUser(_portalUser.fullUserName.toString());
            } else {
              developer.log("message: Неверный токен!" + value.statusCode.toString());
            }
          }),
        } else {
            developer.log(response.statusCode.toString()),
            _showAlertDialog(
                context, 'Ошибка входа', 'Неверный логин и/или пароль')
          }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> _checkAuthentication() async {
    String url = HttpUtils.mainUrl + 'mobile/login';

    return await http.get(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader: NetworkService(_credentials)
            .calculateAuthentication(),
      },
    );
  }

  Future<http.Response> _sendToken() async {
    String url = HttpUtils.mainUrl + 'mobile/token';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("token: " + preferences.getString("token").toString());

    return await http.post(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: NetworkService(_credentials)
          .calculateAuthentication(),
    }, body: (preferences.getString("token") ?? '')
    );
  }


  Future<void> _saveUser(String portalUsername) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('portalUserName', portalUsername);
    });
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => AccountMenu(portalUsername: portalUsername,)
      )
    );
  }

  _showAlertDialog(BuildContext context, String title, String text) {
    // set up the button
    Widget okButton = TextButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}
