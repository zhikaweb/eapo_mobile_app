import 'package:eapo_mobile_app/presentation/btnMainMenu.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../presentation/customBottomAppBar.dart';

class MenuEAPVScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;
    int currentTab = 0;

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
              _currentIndex = value;
              if (value == 0){
                Navigator.of(context).pushNamed('/home');
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

  Widget _containerBtn(String title, String route){
    return Container(
      child: SizedBox (
        height: 60,
        child: BtnMainMenu(title: title, route: route),
      ),
    );
  }
}



