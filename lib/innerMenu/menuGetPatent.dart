import 'package:eapo_mobile_app/presentation/btnInnerMenu.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuGetPatent extends StatefulWidget {
  @override
  _MenuGetPatentState createState() => _MenuGetPatentState();
}

class _MenuGetPatentState extends State<MenuGetPatent> {
  List listUrl = ['https://www.eapo.org/ru/inventors01.html',
    'https://www.eapo.org/ru/inventors02.html',
  'https://www.eapo.org/ru/getpatent2018/',
    'https://www.eapo.org/ru/getpatentpct/',
  'https://www.eapo.org/ru/application2019/'];

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
            title: Text('ПОЛУЧЕНИЕ ПАТЕНТА'),
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
                  children: <Widget>[
                    BtnInnerMenu(title: 'Патентовать или не патентовать', route: listUrl[0],),
                    SizedBox(height: 32,),
                    BtnInnerMenu(title: 'Пять шагов к Евразийскому патенту', route: listUrl[1]),
                    SizedBox(height: 32,),
                    BtnInnerMenu(title: 'Как получить Евразийский патент', route: listUrl[2]),
                    SizedBox(height: 32,),
                    BtnInnerMenu(title: 'Получение Евразийского патента по процедуре РСТ', route: listUrl[3]),
                    SizedBox(height: 32,),
                    BtnInnerMenu(title: 'Как подать евразийскую заявку', route: listUrl[4]),
                  ],
                ),
              )
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

}
