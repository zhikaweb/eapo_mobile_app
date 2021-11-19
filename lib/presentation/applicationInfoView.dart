import 'package:eapo_mobile_app/model/application.dart';
import 'package:eapo_mobile_app/utils/dateFormatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationInfoView extends StatefulWidget {
  final Application application;
  const ApplicationInfoView({Key? key, required this.application}) : super(key: key);

  @override
  _ApplicationInfoViewState createState() => _ApplicationInfoViewState();
}

class _ApplicationInfoViewState extends State<ApplicationInfoView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Text('Номер заявки'),
            SizedBox(width: 10,),
            Text(widget.application.eapoRegNo == null ? '' : widget.application.eapoRegNo.toString()),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text('Наименование', textAlign: TextAlign.start,),
            SizedBox(width: 10,),
            Expanded(
              child: Text(
                widget.application.name == null ? '' : widget.application.name.toString(),
                softWrap: true,
              ),
            )
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text('Дата'),
            SizedBox(width: 10,),
            Text(
              widget.application.eapoRegDate == null ? ''
                  : DateFormatter().formatDate(widget.application.eapoRegDate),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text('Эксперт'),
            SizedBox(width: 10,),
            Text(widget.application.expert == null ? ''
                : widget.application.expert.toString()),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text('Статус'),
            SizedBox(width: 10,),
            Expanded(
              child: Text(widget.application.statusName == null ? ''
                  : widget.application.statusName.toString()),
            ),
          ],
        ),
      ],
    );
  }
}
