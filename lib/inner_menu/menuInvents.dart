import 'package:flutter/material.dart';
import '../about.dart';
import '../CustomBottomAppBar.dart';
import '../presentation/icons.dart';
import '../inner_menu/menuGetPatent.dart';

class MenuInvents extends StatefulWidget {
  @override
  _MenuInventsState createState() => _MenuInventsState();
}

class _MenuInventsState extends State<MenuInvents> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(30, 111, 165, 1.0),
                  Color.fromRGBO(209, 231, 243, 1.0)
                ]
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Изобретения'),
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
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return About();
                                })
                            );
                          },
                          child: Text('Нормативные правовые акты', textAlign: TextAlign.center),
                          color: Color.fromRGBO(233, 241, 245, 1.0),
                          textColor: Color.fromRGBO(30, 111, 165, 1.0)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 32),
                    child: SizedBox (
                      width: 232,
                      height: 56,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return MenuGetPatent();
                              })
                          );
                        },
                        child: Text('Бюллетень', textAlign: TextAlign.center,),
                        color: Color.fromRGBO(233, 241, 245, 1.0),
                        textColor: Color.fromRGBO(30, 111, 165, 1.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 32),
                    child: SizedBox (
                      width: 232,
                      height: 56,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return About();
                              })
                          );
                        },
                        child: Text('Поиск публикаций', textAlign: TextAlign.center),
                        color: Color.fromRGBO(233, 241, 245, 1.0),
                        textColor: Color.fromRGBO(30, 111, 165, 1.0),
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox (
                      width: 232,
                      height: 56,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return About();
                              })
                          );
                        },
                        child: Text('Реестр патентов', textAlign: TextAlign.center),
                        color: Color.fromRGBO(233, 241, 245, 1.0),
                        textColor: Color.fromRGBO(30, 111, 165, 1.0),
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
}
