import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

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

  Material _inputLogin(){
    return Material(
      child: TextFormField(decoration: InputDecoration(
        suffixIcon: Icon(Icons.clear_rounded),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),),
    );
  }

  Material _inputPassword(){
    return Material(
      child: TextFormField(decoration: InputDecoration(
        suffixIcon: Icon(Icons.remove_red_eye_outlined),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),),
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
}
