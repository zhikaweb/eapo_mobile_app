import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountMenu extends StatefulWidget {
  final Credentials credentials;
  const AccountMenu({Key? key, required this.credentials}) : super(key: key);

  @override
  _AccountMenuState createState() => _AccountMenuState();
}

class _AccountMenuState extends State<AccountMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: MainColors().innerPageGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(30, 111, 165, 1.0),
          title: Text('ЛИЧНЫЙ КАБИНЕТ'),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios),
          //   onPressed: () { Navigator.of(context).popAndPushNamed('/home'); },
          // ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/eg_xl.svg'),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset('assets/images/eg_sm_bottomright.svg'),
            ),
            Container(
              child: Column(
                children: [
                  Text('Username: ${widget.credentials.login}')
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
