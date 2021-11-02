import 'package:eapo_mobile_app/presentation/customBottomAppBarImpl.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:eapo_mobile_app/utils/myWebview.dart';
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final _url = 'https://www.eapo.org/ru/contacts.html?mode=m';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: MainColors().innerPageGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: MyWebView(
          title: "О ЕАПВ",
          selectedUrl: Uri.parse(_url).toString(),
        ),
        bottomNavigationBar: _bottomBar(1),
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
