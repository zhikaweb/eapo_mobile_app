import 'dart:convert' as convert;
import 'dart:io';

import 'package:eapo_mobile_app/account/accountMenu.dart';
import 'package:eapo_mobile_app/model/portalUser.dart';
import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/httpUtils.dart';
import 'package:eapo_mobile_app/utils/networkService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);

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
          SizedBox(height: 60, child: _inputLogin(),),
          SizedBox(height: 32,),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 0, top: 0, bottom: 8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Пароль', style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          ),
          SizedBox(height: 60, child: _inputPassword(),),
          SizedBox(height: 32,),
          _btnSubmit(),
          SizedBox(height: 32,),
          SizedBox(width: 200, child: _divider(),),
          SizedBox(height: 32,),
          _btnNewUser(),
        ],
      ),
    );
  }

  TextFormField _inputLogin(){
    return TextFormField(
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
        if (value == null || value.isEmpty) {
          return 'Please enter login';
        }
        return null;
      },
      onSaved: (value) => _credentials.login = value!.trim(),
    );
  }

  TextFormField _inputPassword(){
    return TextFormField(
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
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },
      onSaved: (value) => _credentials.password = value!.trim(),
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
            onPressed: () {
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
      print('Form is valid!');
      _globalKey.currentState!.save();
      _loadData();
    }
    else {
      print('Form is not valid!');
    }
  }

  void _loadData() {
    _checkAuthentication().then((response) => {
        if (response.statusCode == 200) {
          print(response.body),
          _portalUser = new PortalUser.fromJson(convert.json.decode(response.body)),
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => AccountMenu(portalUser: _portalUser,)
            )
          ),
        } else {
          print(response.statusCode),
          _showAlertDialog(context, 'Ошибка входа', 'Неверный логин и/или пароль')
        }
      }).catchError((error) {
        debugPrint(error.toString());
      });
  }

  Future<http.Response> _checkAuthentication() async {
    var url = HttpUtils.mainUrl + 'mobile/login';

    return await http.get(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader: NetworkService(_credentials)
            .calculateAuthentication(),
      },
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
