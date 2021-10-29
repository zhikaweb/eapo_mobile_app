import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:enough_convert/enough_convert.dart';
import 'package:flutter_svg/svg.dart';

import '../presentation/customBottomAppBar.dart';

class PharmRegistry extends StatefulWidget {
  @override
  _PharmRegistryState createState() => _PharmRegistryState();
}

class _PharmRegistryState extends State<PharmRegistry> {
  String _url = 'https://www.eapo.org/ru/mobile/sfarma.php';
  String _urlSearch = 'https://www.eapo.org/ru/mobile/sfarma.php?SEARCH%5Bfarma%5D=';
  late String _searchRequest;
  int _currentIndex = 4;
  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  late InAppWebViewController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(189, 218, 234, 1.0),
                Color.fromRGBO(189, 218, 234, 1.0)
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(30, 111, 165, 1.0),
          title: Text('ФАРМРЕЕСТР'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/home');
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: _form(),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 0, top: 70, left: 0, right: 0),
                  child: _webView(),
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
          child: _bottomAppBar(),
        )
      ),
    );
  }

  void _search() {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      final codec = const Windows1251Codec(allowInvalid: false);
      final encoded = codec.encode(_searchRequest);

      var data = Uri.dataFromBytes(encoded, mimeType: '', percentEncoded: true);
      print(data.data!.contentText);
      var encodedData = data.data!.contentText;

      _controller.loadUrl(
          urlRequest: URLRequest(url: Uri.parse(_urlSearch + encodedData)));
    }
  }

  Form _form() {
    return Form(
      key: _globalKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            child: SizedBox(
              width: 200,
              height: 50,
              child: _materialTextFieldSearch(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            child: SizedBox(
              width: 120,
              child: _materialBtn(),
            ),
          )
        ],
      ),
    );
  }

  Material _materialBtn(){
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(8.0),
      color: Color.fromRGBO(233, 241, 245, 1.0),
      child: MaterialButton(
          child: Text('Поиск'),
          onPressed: () {
            _search();
          }
      ),
    );
  }

  Material _materialTextFieldSearch(){
    return Material(
      child: TextFormField(
        controller: _textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        showCursor: true,
        onSaved: (value) {
          _searchRequest = value!;
        },
      ),
    );
  }

  Widget _webView(){
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(_url)),
      onWebViewCreated: (controller) {
        _controller = controller;
      },
    );
  }

  CustomBottomAppBar _bottomAppBar(){
    return CustomBottomAppBar(
      color: Colors.white,
      backgroundColor: Color.fromRGBO(121, 175, 208, 1.0),
      selectedColor: Colors.white,
      notchedShape: CircularNotchedRectangle(),
      onTabSelected: (value) {
        _currentIndex = value;
        switch (value) {
          case 0:
            Navigator.of(context).pushNamed('/home');
            break;
          case 1:
            Navigator.of(context).pushNamed('/menuEapo');
            break;
          case 2:
            Navigator.of(context).pushNamed('/menuInvents');
            break;
          case 3:
            Navigator.of(context).pushNamed('/menuDesigns');
            break;
        }
      },
      items: [
        CustomBottomAppBarItem(iconData: SvgPicture.asset('assets/images/home.svg')),
        CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/eye.svg")),
        CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/atom.svg")),
        CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/game.svg")),
        CustomBottomAppBarItem(iconData: _currentIndex == 4
            ? SvgPicture.asset("assets/images/pill_active.svg")
            : SvgPicture.asset("assets/images/pill.svg")),
        CustomBottomAppBarItem(iconData: SvgPicture.asset("assets/images/key.svg"))
      ],
    );
  }
}
