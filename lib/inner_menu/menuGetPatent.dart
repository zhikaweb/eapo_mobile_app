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
                    _btn('Патентовать или не патентовать', listUrl[0]),
                    SizedBox(height: 32,),
                    _btn('Пять шагов к Евразийскому патенту', listUrl[1]),
                    SizedBox(height: 32,),
                    _btn('Как получить Евразийский патент', listUrl[2]),
                    SizedBox(height: 32,),
                    _btn('Получение Евразийского патента по процедуре РСТ', listUrl[3]),
                    SizedBox(height: 32,),
                    _btn('Как подать евразийскую заявку', listUrl[4]),
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

  Widget _btn(String title, String route){
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: Color.fromRGBO(233, 241, 245, 1.0),
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            height: 60,
            onPressed: () {
              _launchUrl(route);
            },
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 111, 165, 1.0)),
            )
        )
    );
  }

  void _launchUrl(String url) async =>
      await canLaunch(Uri.encodeFull(url)) ? await launch(Uri.encodeFull(url)) : throw 'Could not launch $url';

}
