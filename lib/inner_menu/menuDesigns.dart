import 'package:eapo_mobile_app/designPages/designBulletin.dart';
import 'package:eapo_mobile_app/designPages/designDocs.dart';
import 'package:eapo_mobile_app/designPages/searchPublDesign.dart';
import 'package:eapo_mobile_app/inventPages/searchPubl.dart';
import 'package:flutter/material.dart';
import '../staticPages/about.dart';
import '../presentation/customBottomAppBar.dart';
import '../presentation/icons.dart';
import '../inner_menu/menuGetPatent.dart';

class MenuDesigns extends StatefulWidget {
  @override
  _MenuDesignsState createState() => _MenuDesignsState();
}

class _MenuDesignsState extends State<MenuDesigns> {
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
            title: Text('ПРОМОБРАЗЦЫ'),
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
                            Navigator.of(context).pushNamed('/designDocs');
                          },
                          child: Text('Нормативные правовые акты', textAlign: TextAlign.center)
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
                          Navigator.of(context).pushNamed('/designBull');
                        },
                        child: Text('Бюллетень', textAlign: TextAlign.center,)
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
                          Navigator.of(context).pushNamed('/searchPublDesign');
                        },
                        child: Text('Поиск публикаций', textAlign: TextAlign.center)
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
