import 'package:flutter/material.dart';
import 'package:itstrue/data/class/CardModel.dart';

class MiniCard extends StatelessWidget {
  final CardModel cardData;
  final bool showName;
  MiniCard({Key key, this.cardData,this.showName = false}) : super(key: key);    

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: new Offset(0, 4.0),
            )
          ],
          image: DecorationImage(
            image: AssetImage(cardData.cardTemplate.bgImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Navigator.of(context).pushNamed('/post',arguments:cardData);
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[



              /**
               * Card Title 
               * ----------
               */
              Text(
                cardData.title,
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    color: cardData.cardTemplate.titleColor),
              ),
              
              SizedBox(height: 10),


              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white30),
                      child: Row(
                        children: <Widget>[
                          Text(
                            cardData.postId,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold),
                          ),
                          if(cardData.isVerified)
                          Icon(
                            Icons.verified_user,
                            color: Colors.green,
                            size: 13.0,
                          )
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        
                        if(this.showName)
                          Text(cardData.requesterName, style: TextStyle(fontSize: 11.0, color: Color(0xAA000000))),

                        Row(children: <Widget>[
                          Text(cardData.messages[0].time + " ", style: TextStyle(fontSize: 8.0, color: Color(0xAA000000))),
                          Icon(Icons.access_time, size: 9.0, color: Color(0xCC000000)),
                          Text(" " + cardData.messages[0].date,style: TextStyle(fontSize: 8.0, color: Color(0xAA000000)))
                        ])
                      ],
                    )

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
