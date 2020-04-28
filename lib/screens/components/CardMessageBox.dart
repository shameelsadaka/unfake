import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:itstrue/screens/templates/CardTemplate.dart';
import 'package:itstrue/data/class/CardModel.dart';


class CardMessageBox extends StatelessWidget {
  final CardMessage message;
  final CardTemplate cardTemplate;
  final bool important;

  const CardMessageBox(
      {Key key, this.message, this.cardTemplate,this.important = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB( (important?22.0:50) , 5.0 , 22.0  ,  5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Card Content

          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            decoration: BoxDecoration(
                color: cardTemplate.messageBoxColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: Text(
              this.message.body,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: cardTemplate.messageColor),
            ),
          ),

          // Posted Time

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this.message.time + " ",
                  style: TextStyle(fontSize: 8.0, color: Color(0xCC000000))),
              Icon(Icons.access_time, size: 9.0, color: Color(0xCC000000)),
              Text(" " + this.message.date,
                  style: TextStyle(fontSize: 8.0, color: Color(0xCC000000)))
            ],
          )
        ],
      ),
    );
  }
}