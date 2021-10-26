import 'package:eapo_mobile_app/presentation/customBtnMainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../presentation/customBottomAppBar.dart';

class MenuInvents extends StatefulWidget {
  @override
  _MenuInventsState createState() => _MenuInventsState();
}

class _MenuInventsState extends State<MenuInvents> {
  int _currentIndex = 2;
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
            backgroundColor: Color.fromRGBO(30, 111, 165, 1.0),
            title: Text('ИЗОБРЕТЕНИЯ'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () { Navigator.of(context).popAndPushNamed('/home'); },
            ),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: SvgPicture.asset('assets/images/eg_lg_top_r.svg'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 32),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 32,
                      height: 60,
                      child: CustomBtnMainMenu(title: 'Нормативные правовые акты', route: '/inventDocs'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 32),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 32,
                      height: 60,
                      child: CustomBtnMainMenu(title: 'Бюллетень', route: '/inventBull'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 32),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 32,
                      height: 60,
                      child: CustomBtnMainMenu(title: 'Поиск публикаций', route: '/searchPubl'),
                    ),
                  ),
                  Container(
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 32,
                      height: 60,
                      child: CustomBtnMainMenu(title: 'Реестр патентов', route: '/patentRegistry'),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset('assets/images/eg_sm_bottomleft.svg'),
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
                // if (value == 2){
                //   Navigator.of(context).pushNamed('/menuInvents');
                // }
                if (value == 3){
                  Navigator.of(context).pushNamed('/menuDesigns');
                }
                if (value == 4){
                  Navigator.of(context).pushNamed('/pharma');
                }
              },
              items: [
                CustomBottomAppBarItem(iconData: SvgPicture.asset('assets/images/home.svg')),
                CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/eye.svg")),
                CustomBottomAppBarItem(iconData: _currentIndex == 2
                    ? SvgPicture.asset("assets/images/atom_active.svg")
                    : SvgPicture.asset("assets/images/atom.svg")),
                CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/game.svg")),
                CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/pill.svg")),
                CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/key.svg"))
              ],
            ),
          )
        )
    );
  }
}
