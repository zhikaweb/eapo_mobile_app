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
  int _currentIndex = 3;
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
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () { Navigator.of(context).popAndPushNamed('/home'); },
            ),
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
                    padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 32),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 32,
                      height: 60,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
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
                          child: Text('Нормативные правовые акты', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 32),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 32,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
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
                        child: Text('Бюллетень', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),)
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 32,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
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
                        child: Text('Поиск публикаций', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),)
                      ),
                    ),
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
              color: Colors.white,
              backgroundColor: Color.fromRGBO(121, 175, 208, 1.0),
              selectedColor: Colors.white,
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
                if (value == 1){
                  Navigator.of(context).pushNamed('/menuEapo');
                }
                if (value == 2){
                  Navigator.of(context).pushNamed('/menuInvents');
                }
                // if (value == 3){
                //   Navigator.of(context).pushNamed('/menuDesigns');
                // }
                if (value == 4){
                  Navigator.of(context).pushNamed('/pharma');
                }
              },
              items: [
                CustomBottomAppBarItem(iconData: Image(
                  image: AssetImage("assets/images/home.png"),
                )),
                CustomBottomAppBarItem(iconData: Image(
                  image: AssetImage("assets/images/eye.png"),
                )),
                CustomBottomAppBarItem(iconData: Image(
                  image: AssetImage("assets/images/atom.png"),
                )),
                CustomBottomAppBarItem(iconData: _currentIndex == 3 ? Image(
                  image: AssetImage("assets/images/game_active.png"),
                ) : Image(
                  image: AssetImage("assets/images/game.png"),
                )),
                CustomBottomAppBarItem(iconData: Image(
                  image: AssetImage("assets/images/pill.png"),
                )),
                CustomBottomAppBarItem(iconData: Image(
                  image: AssetImage("assets/images/key.png"),
                ))
              ],
            ),
          )
        )
    );
  }
}
