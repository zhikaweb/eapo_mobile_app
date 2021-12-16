import 'package:eapo_mobile_app/presentation/mainColors.dart';
import 'package:flutter/material.dart';

class AppDropdownInput extends StatefulWidget {
  final List items;
  const AppDropdownInput({Key? key, required this.items}) : super(key: key);

  @override
  _AppDropdownInputState createState() => _AppDropdownInputState();
}

class _AppDropdownInputState extends State<AppDropdownInput> {
  bool _selected = false;
  dynamic _choice = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 16,
        child: DropdownButton<dynamic>(
          value: _selected ? _choice : null,
          hint: Text("Выберите документ",
            style: TextStyle(color: MainColors().eapoColorMain,
              fontSize: 18,
            ),
          ),
          elevation: 16,
          style: TextStyle(color: MainColors().eapoColorMain),
          underline: Container(
            height: 2,
            color: MainColors().eapoColorMain,
          ),
          onChanged: (newValue) {
            setState(() {
              _dropDownItemSelected(newValue!);
            });
          },
          items: widget.items
              .map<DropdownMenuItem<dynamic>>((value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Container(
                margin: EdgeInsets.only(bottom: 10, right: 0, left: 0, top: 0),
                child: Text(value.toString(), maxLines: 3, overflow: TextOverflow.fade, style: TextStyle(
                  fontSize: 18
                ),),
                width: MediaQuery.of(context).size.width - 42,
              )
            );
          }).toList(),
        ),
    );
  }

  void _dropDownItemSelected(dynamic valueSelectedByUser) {
    setState(() {
      this._choice = valueSelectedByUser;
      _selected = true;
    });
  }
}
