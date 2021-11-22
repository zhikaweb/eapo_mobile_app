import 'package:eapo_mobile_app/model/application.dart';
import 'package:eapo_mobile_app/presentation/mainColors.dart';
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

  final int maxLines = 10;
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text('Номер заявки',
                  style: TextStyle(
                    fontSize: 16,
                    color: MainColors().eapoColorMain,
                  ),),
              ),
              SizedBox(width: 10,),
              Text(widget.application.eapoRegNo == null ? '' : widget.application.eapoRegNo.toString(),
                style: TextStyle(
                    fontSize: 16,
                    color: MainColors().eapoColorMain
                ),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text('Наименование',
                  style: TextStyle(
                    fontSize: 16,
                    color: MainColors().eapoColorMain,
                  ),),
              ),
              SizedBox(width: 10,),
              // expandableText(widget.application.name),
              Expanded(
                  child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(
                    widget.application.name == null ? '' : widget.application.name.toString(),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: _isExpanded ? 1 : maxLines,
                    style: TextStyle(
                      fontSize: 16,
                      color: MainColors().eapoColorMain,
                    ),
                  ),
                )
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text('Дата',
                  style: TextStyle(
                    fontSize: 16,
                    color: MainColors().eapoColorMain,
                  ),),
              ),
              SizedBox(width: 10,),
              Text(
                widget.application.eapoRegDate == null ? ''
                    : DateFormatter().formatDate(widget.application.eapoRegDate),
                style: TextStyle(
                    fontSize: 16,
                    color: MainColors().eapoColorMain
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text('Эксперт',
                  style: TextStyle(
                    fontSize: 16,
                    color: MainColors().eapoColorMain,
                  ),),
              ),
              SizedBox(width: 10,),
              Text(widget.application.expert == null ? ''
                  : widget.application.expert.toString(),
                style: TextStyle(
                    fontSize: 16,
                    color: MainColors().eapoColorMain
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text('Статус',
                  style: TextStyle(
                    fontSize: 16,
                    color: MainColors().eapoColorMain,
                  ),),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Text(widget.application.statusName == null ? ''
                    : widget.application.statusName.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: MainColors().eapoColorMain
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }

  GestureDetector expandableText(String? text){
    final int maxLines = 3;
    bool _isExpanded = false;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Text(
        text!,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        maxLines: _isExpanded ? null : maxLines,
      ),
    );
  }
}
