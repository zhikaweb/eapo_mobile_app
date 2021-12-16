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
  var selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 16,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(4.0),
              child: DropdownButton<dynamic>(
                value: selectedItem,
                hint: Text("Выберите количество месяцев",
                  style: TextStyle(color: Colors.black87, fontSize: 18),
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
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text("Сумма", style: TextStyle(color: MainColors().eapoColorMain, fontSize: 18),),
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
      ),
    );
  }

  void _dropDownItemSelected(dynamic valueSelectedByUser) {
    setState(() {
      _sumEditingController.text = selectedItem = valueSelectedByUser;
    });
  }
}
