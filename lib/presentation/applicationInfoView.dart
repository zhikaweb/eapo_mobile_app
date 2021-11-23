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
                width: 100,
                child: Text(widget.application.eapoRegNo == null ? '' : '№ заявки',
                  style: fontStyle(),
                ),
              ),
              SizedBox(width: 10,),
              Text(widget.application.eapoRegNo == null ? '' : widget.application.eapoRegNo.toString(),
                style: fontStyle(),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(widget.application.name == null ? '' : 'Название',
                  style: fontStyle(),
                ),
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
                    style: fontStyle(),
                  ),
                )
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(widget.application.eapoRegDate == null ? ''
                    : 'Получена',
                  style: fontStyle(),
                ),
              ),
              SizedBox(width: 10,),
              Text(
                widget.application.eapoRegDate == null ? ''
                    : DateFormatter().formatDate(widget.application.eapoRegDate),
                style: fontStyle(),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(widget.application.expert == null ? ''
                    : 'Эксперт',
                  style: fontStyle(),
                ),
              ),
              SizedBox(width: 10,),
              Text(widget.application.expert == null ? ''
                  : widget.application.expert.toString(),
                style: fontStyle(),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(widget.application.statusName == null ? ''
                    : 'Статус',
                  style: fontStyle(),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Text(widget.application.statusName == null ? ''
                    : widget.application.statusName.toString(),
                  style: fontStyle(),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }

  TextStyle fontStyle(){
    return TextStyle(
      fontSize: 16,
      color: MainColors().eapoColorMain,
      fontWeight: FontWeight.bold
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
