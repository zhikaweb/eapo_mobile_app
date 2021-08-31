import 'package:eapo_mobile_app/pharma/PharmRegistry.dart';
import 'package:flutter/material.dart';
import 'inner_menu/menuDesigns.dart';
import 'inner_menu/menuEapv.dart';
import 'inner_menu/menuInvents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [new Color.fromRGBO(30, 111, 165, 1.0),
              new Color.fromRGBO(209, 231, 243, 1.0)]
          )
      ),
      child: Scaffold(
          appBar: new AppBar(
              flexibleSpace: Image(
                  image: AssetImage('assets/images/logo_main.png'),
                  fit: BoxFit.fill
              ),
              backgroundColor: new Color.fromRGBO(30, 111, 165, 1.0)
          ),
          body: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return MenuEAPVScreen();
                                })
                            );
                          },
                          child: Image(
                              image: AssetImage('assets/images/o_eapv.png'),
                              fit: BoxFit.fitWidth
                          ),
                        ),
                        Image(
                            image: AssetImage('assets/images/emptygear.png'),
                            fit: BoxFit.fitWidth
                        )
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return MenuInvents();
                              })
                          );
                        },
                        child: Image(
                            image: AssetImage('assets/images/izobretenie.png'),
                            fit: BoxFit.fitWidth
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return MenuDesigns();
                              })
                          );
                        },
                        child: Image(
                            image: AssetImage('assets/images/promobrazcy.png'),
                            fit: BoxFit.fitWidth
                        )
                      )
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image(
                            image: AssetImage('assets/images/emptygear.png'),
                            fit: BoxFit.fitWidth
                        ),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return PharmRegistry();
                                })
                            );
                          },
                          child: Image(
                              image: AssetImage('assets/images/farmreestr.png'),
                              fit: BoxFit.fitWidth
                          )
                      ),
                      Image(
                            image: AssetImage('assets/images/lichny_cab.png'),
                            fit: BoxFit.fitWidth
                        )
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                        Image(
                            image: AssetImage('assets/images/emptygear.png'),
                            fit: BoxFit.fitWidth
                        )
                    ],
                  )
                ],
              )
          ),
          backgroundColor: Colors.transparent
      ),
    );
  }
}

