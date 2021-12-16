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
            DropdownButton<dynamic>(
              hint: Text("Выберите количество месяцев",
                style: TextStyle(color: MainColors().eapoColorMain, fontSize: 18),
              ),
              elevation: 16,
              style: TextStyle(color: MainColors().eapoColorMain),
              underline: Container(
                height: 2,
                color: MainColors().eapoColorMain,
              ),
              items: widget.monthPayments.entries
                  .map<DropdownMenuItem<String>>(
                      (MapEntry<String, dynamic> e) => DropdownMenuItem<String>(
                    value: e.value.toString(),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 42,
                        child: Text(e.key, maxLines: 3, overflow: TextOverflow.fade,),
                    ),
                  ))
                  .toList(),
              onChanged: (newKey) {
                _dropDownItemSelected(newKey);
              },
            ),
            SizedBox(height: 20,),
            Text("Сумма", style: TextStyle(color: MainColors().eapoColorMain, fontSize: 18),),
            Material(
              child: TextFormField(
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
