import 'package:eapo_mobile_app/model/portalUser.dart';
import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/presentation/btnMainMenu.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountMenu extends StatefulWidget {
  // final Credentials credentials;
  final PortalUser portalUser;
  const AccountMenu({Key? key, required this.portalUser}) : super(key: key);

  @override
  _AccountMenuState createState() => _AccountMenuState();
}

class _AccountMenuState extends State<AccountMenu> {

  @override
  void initState() {
    super.initState();
  }

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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${widget.portalUser.fullUserName!.toUpperCase()}',
                      style: TextStyle(
                      color: MainColors().eapoColorMain,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16,),
                  _divider(),
                  SizedBox(height: 32,),
                  BtnFoo(title: 'Уведомления'),
                  SizedBox(height: 32,),
                  BtnMainMenu(title: 'Информация по заявке', route: '/applicationInfo',),
                  SizedBox(height: 32,),
                  BtnFoo(title: 'Уплата ППС'),
                  SizedBox(height: 32,),
                  BtnFoo(title: 'Продление срока ответа'),
                ],
              ),
            )
          ]
        ),
        bottomNavigationBar: _bottomBar(5),
      ),
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

  Material _divider(){
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(2.0),
      color: MainColors().eapoColorMain,
      child: Divider(color: MainColors().eapoColorMain, height: 2,),
    );
  }
}
