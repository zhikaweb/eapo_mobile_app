import 'package:eapo_mobile_app/presentation/btnMainMenu.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../presentation/customBottomAppBar.dart';

class MenuEAPVScreen extends StatelessWidget {

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
          title: Text('О ЕАПВ'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () { Navigator.of(context).popAndPushNamed('/home'); },
          ),
        ),
        body: Stack(
          // alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              child: SvgPicture.asset('assets/images/eg_lg_top_r.svg'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _containerBtn('О ведомстве', '/about'),
                  SizedBox(height: 32,),
                  _containerBtn('Процедура получения патента', '/getPatent'),
                  SizedBox(height: 32,),
                  _containerBtn('Банковские реквизиты', '/accounts'),
                  SizedBox(height: 32,),
                  _containerBtn('Контакты', '/contacts'),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset('assets/images/eg_sm_bottomleft.svg'),
            ),
          ],
        ),
        bottomNavigationBar: _bottomBar(1),
        )
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

  Widget _containerBtn(String title, String route){
    return Container(
      child: SizedBox (
        height: 60,
        child: BtnMainMenu(title: title, route: route),
      ),
    );
  }
}



