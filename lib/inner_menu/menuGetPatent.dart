import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../presentation/customBottomAppBar.dart';
import '../presentation/icons.dart';

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
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(189, 218, 234, 1.0),
                  Color.fromRGBO(189, 218, 234, 1.0)
                ]
            )
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 32),
                    child: sizedBoxWithBtn('Патентовать или не патентовать', listUrl[0]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 32),
                    child: sizedBoxWithBtn('Пять шагов к Евразийскому патенту', listUrl[1]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 32),
                    child: sizedBoxWithBtn('Как получить Евразийский патент', listUrl[2]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 32),
                    child: sizedBoxWithBtn('Получение Евразийского патента по процедуре РСТ', listUrl[3]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
                    child: sizedBoxWithBtn('Как подать евразийскую заявку', listUrl[4]),
                  ),
                ],
              ),
            ],
          ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)
              ),
              child: CustomBottomAppBar(
                color: Colors.black,
                backgroundColor: Color.fromRGBO(121, 175, 208, 1.0),
                selectedColor: Colors.black,
                notchedShape: CircularNotchedRectangle(),
                onTabSelected: (value) {
                  final routes = ["/home", "/menuEapo", "/menuInvents", "/menuDesigns", "/pharma"];
                  _currentIndex = value;
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //     routes[value], (route) => false);
                  if (value == 0){
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        routes[value], (route) => false);
                  }
                  if (value == 2){
                    Navigator.of(context).pushNamed('/menuInvents');
                  }
                  if (value == 3){
                    Navigator.of(context).pushNamed('/menuDesigns');
                  }
                  if (value == 4){
                    Navigator.of(context).pushNamed('/pharma');
                  }

                },
                items: [
                  CustomBottomAppBarItem(iconData: SvgPicture.asset('assets/images/home.svg')),
                  CustomBottomAppBarItem(iconData: _currentIndex == 1
                      ? SvgPicture.asset("assets/images/eye_active.svg")
                      : SvgPicture.asset("assets/images/eye.svg")),
                  CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/atom.svg")),
                  CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/game.svg")),
                  CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/pill.svg")),
                  CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/key.svg"))
                ],
              ),
            )
        )
    );
  }

  Widget sizedBoxWithBtn(String title, String route){
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
