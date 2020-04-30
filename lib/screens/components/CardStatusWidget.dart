import 'package:flutter/material.dart';
import 'package:itstrue/data/class/CardModel.dart';


class CardStatusWidget extends StatelessWidget {
  final CardStatus status;

  CardStatusWidget({Key key,this.status});

  @override
  Widget build(BuildContext context) {
    if(status == CardStatus.important){
      return Container(
        margin:EdgeInsets.fromLTRB(20,0,20,5),
        child: Row(children: <Widget>[
          Icon(Icons.info_outline,size:13,color: Colors.black54),
          SizedBox(width:4),
          Text('Very Important',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black45))
        ]),
      );        
    }
    else if(status == CardStatus.closed){
      return Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(15.0),
          color: Colors.black87
        ),
        padding:EdgeInsets.fromLTRB(10,8,20,8),
        margin:EdgeInsets.fromLTRB(20,0,20,10),
        child: Row(children: <Widget>[
          Icon(Icons.done,size:18,color: Colors.white),
          SizedBox(width:4),
          Expanded(child: Text("Case Completed. Stop sharing this card",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white)))
        ]),
      );
    }
    else if(status == CardStatus.deleted){
      return Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(15.0),
          color: Color(0xFFCC0000)
        ),
        padding:EdgeInsets.fromLTRB(10,8,20,8),
        margin:EdgeInsets.fromLTRB(20,0,20,10),
        child: Row(children: <Widget>[
          Icon(Icons.close,size:18,color: Colors.white),
          SizedBox(width:4),
          Expanded(child: Text("This card is canceled. Don't share ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white)))
        ]),
      );
    }
    else if(status == CardStatus.blocked){
      return Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(15.0),
          color: Color(0xFFCC3300)
        ),
        padding:EdgeInsets.fromLTRB(10,10,40,10),
        margin:EdgeInsets.fromLTRB(20,0,20,10),
        child: Row(
          children: <Widget>[
          Icon(Icons.block,size:18,color: Colors.white),
          SizedBox(width:6),
          Expanded(child: Text("This card is unverified and blocked by admin. Verify before sharing",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white)))
        ]),
      );
    }
    else if(status == CardStatus.fake){
      return Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(15.0),
          color: Color(0xFFCC0000)
        ),
        padding:EdgeInsets.fromLTRB(10,8,40,8),
        margin:EdgeInsets.fromLTRB(20,0,20,10),
        child: Row(
          children: <Widget>[
          Icon(Icons.close,size:22,color: Colors.white),
          SizedBox(width:4),
          Expanded(child: Text("This message is fake. Don't share!",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)))
        ]),
      );
    }
    else if(status == CardStatus.reported){
      return Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(15.0),
          color: Color(0x77CC0000)
        ),
        padding:EdgeInsets.fromLTRB(10,8,40,8),
        margin:EdgeInsets.fromLTRB(20,0,20,10),
        child: Row(
          children: <Widget>[
          Icon(Icons.error_outline ,size:16,color: Colors.white),
          SizedBox(width:6),
          Expanded(child: Text("Some people reported this card as fake. Verify before sharing",style: TextStyle(fontSize: 13,color: Colors.white)))
        ]),
      );
    }
    else{
      return new Container();
    }
  }
}
