import 'package:eapo_mobile_app/presentation/btnMainMenu.dart';
import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuDesigns extends StatefulWidget {
  @override
  _MenuDesignsState createState() => _MenuDesignsState();
}

class _MenuDesignsState extends State<MenuDesigns> {

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
            title: Text('ПРОМОБРАЗЦЫ'),
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
                    BtnMainMenu(title: 'Нормативные правовые акты', route: '/designDocs'),
                    SizedBox(height: 32,),
                    BtnMainMenu(title: 'Бюллетень', route: '/designBull'),
                    SizedBox(height: 32,),
                    BtnMainMenu(title: 'Поиск публикаций', route: '/searchPublDesign'),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset('assets/images/eg_sm_bottomleft.svg'),
              ),
            ],
          ),
          bottomNavigationBar: _bottomBar(3),
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
