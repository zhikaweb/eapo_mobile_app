import 'package:flutter/material.dart';
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
  'https://www.eapo.org/ru/getpatent2018/', 'https://www.eapo.org/ru/getpatentpct/',
  'https://www.eapo.org/ru/application2019/'];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(209, 231, 243, 1.0),
                  Color.fromRGBO(209, 231, 243, 1.0)
                ]
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Получение патента'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 32),
                    child: SizedBox (
                      width: 232,
                      height: 56,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)
                              )
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(233, 241, 245, 1.0)
                          ),
                          foregroundColor: MaterialStateProperty.all(Color.fromRGBO(30, 111, 165, 1.0))
                        ),
                          onPressed: () {
                            _launchUrl(listUrl[0]);
                          },
                          child: Text('Патентовать или не патентовать', textAlign: TextAlign.center),
                          // textColor: Color.fromRGBO(30, 111, 165, 1.0)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 32),
                    child: SizedBox (
                      width: 232,
                      height: 56,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(233, 241, 245, 1.0)
                            ),
                            foregroundColor: MaterialStateProperty.all(Color.fromRGBO(30, 111, 165, 1.0))
                        ),
                        onPressed: () {
                          _launchUrl(listUrl[0]);
                        },
                        child: Text('Пять шагов к Евразийскому патенту', textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 32),
                    child: SizedBox (
                      width: 232,
                      height: 56,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(233, 241, 245, 1.0)
                            ),
                            foregroundColor: MaterialStateProperty.all(Color.fromRGBO(30, 111, 165, 1.0))
                        ),
                        onPressed: () {
                          _launchUrl(listUrl[0]);
                        },
                        child: Text('Как получить Евразийский патент', textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 32),
                    child: SizedBox (
                      width: 232,
                      height: 56,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(233, 241, 245, 1.0)
                            ),
                            foregroundColor: MaterialStateProperty.all(Color.fromRGBO(30, 111, 165, 1.0))
                        ),
                        onPressed: () {
                          _launchUrl(listUrl[0]);
                        },
                        child: Text('Получение Евразийского патента по процедуре РСТ',
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox (
                      width: 232,
                      height: 56,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(233, 241, 245, 1.0)
                            ),
                            foregroundColor: MaterialStateProperty.all(Color.fromRGBO(30, 111, 165, 1.0))
                        ),
                        onPressed: () {
                          _launchUrl(listUrl[0]);
                        },
                        child: Text('Как подать евразийскую заявку',
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomAppBar(
            color: Colors.white,
            backgroundColor: Color.fromRGBO(121, 175, 208, 1.0),
            selectedColor: Colors.white,
//          notchedShape: null,
//          onTabSelected: _onTapped,
            items: [
              CustomBottomAppBarItem(iconData: MyFlutterApp.home),
              CustomBottomAppBarItem(iconData: MyFlutterApp.eye),
              CustomBottomAppBarItem(iconData: MyFlutterApp.invents),
              CustomBottomAppBarItem(iconData: MyFlutterApp.designs),
              CustomBottomAppBarItem(iconData: MyFlutterApp.pharma),
              CustomBottomAppBarItem(iconData: MyFlutterApp.key)
            ],
          ),
        )
    );
  }

  void _launchUrl(String url) async =>
      await canLaunch(Uri.encodeFull(url)) ? await launch(Uri.encodeFull(url)) : throw 'Could not launch $url';

}
