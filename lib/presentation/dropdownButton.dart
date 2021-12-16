import 'package:flutter/material.dart';

import 'mainColors.dart';

class AppDropdownButton extends StatefulWidget {

  final Map<String, dynamic> monthPayments;
  const AppDropdownButton({Key? key, required this.monthPayments}) : super(key: key);

  @override
  _AppDropdownButtonState createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  TextEditingController _sumEditingController = TextEditingController();
  bool _selected = false;
  var selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 16,
                child: DropdownButton<dynamic>(
                  value: _selected ? selectedItem : null,
                  hint: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text("Выберите количество месяцев",
                      style: TextStyle(color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  elevation: 16,
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                  items: widget.monthPayments.entries
                      .map<DropdownMenuItem<String>>(
                          (MapEntry<String, dynamic> e) => DropdownMenuItem<String>(
                        value: e.value.toString(),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          width: MediaQuery.of(context).size.width - 42,
                          height: 20,
                          child: Text(e.key),
                        ),
                      ))
                      .toList(),
                  onChanged: (newKey) {
                    _dropDownItemSelected(newKey);
                  },
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text("Сумма", style: fontStyle()),
            ),
            Material(
              child: TextFormField(
                style: TextStyle(fontSize: 18),
                controller: _sumEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusColor: MainColors().eapoColorMain,
                ),
              ),
            ),
          ]
    );
  }

  TextStyle fontStyle(){
    return TextStyle(
        fontSize: 18,
        color: MainColors().eapoColorMain,
        fontWeight: FontWeight.bold
    );
  }

  void _dropDownItemSelected(dynamic valueSelectedByUser) {
    setState(() {
      _sumEditingController.text = selectedItem = valueSelectedByUser;
      _selected = true;
    });
  }
}
