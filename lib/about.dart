import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(),
        body: Center(
          child: Container(
//            child: ,
          )
        ),
        bottomNavigationBar: new BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_to_queue),
                  title: Text('привет')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_to_queue),
                  title: Text('привет')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_to_queue),
                  title: Text('привет')
              )
            ], backgroundColor: Colors.amberAccent
        ),
      ),
    );
  }
}
