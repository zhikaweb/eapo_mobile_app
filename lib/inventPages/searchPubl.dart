import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/myWebview.dart';
import 'package:flutter/material.dart';

class SearchPubl extends StatefulWidget {

  @override
  _SearchPublState createState() => _SearchPublState();
}

class _SearchPublState extends State<SearchPubl> {
  final _url = 'https://www.eapo.org/ru/mobile/publicat.php';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: MainColors().innerPageGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: MyWebView(
          title: "ПОИСК ПУБЛИКАЦИЙ",
          selectedUrl: Uri.parse(_url).toString(),
        ),
        bottomNavigationBar: _bottomBar(2),
      ),
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
