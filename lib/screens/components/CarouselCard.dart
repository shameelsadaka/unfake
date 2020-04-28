import 'package:flutter/material.dart';
import 'package:itstrue/screens/templates/CardTemplate.dart';
import 'package:itstrue/data/class/CardModel.dart';

class CarouselCard extends StatelessWidget {
  final CardModel cardData;

  CarouselCard({Key key, this.cardData}) : super(key: key);  



    void postAction(String action) {
    print(action);

    switch(action){
      case "share":
        break;
      case "report":
        break;
      case "save":
        break;
      
    }
    ///
    ///   To be expanded
    /// 
    ///   TODO
    ///   * Extract this function to the controller
    /// 
    ///   There is a copy of this function in post view
    ///
    
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Hero(
          tag: cardData.postId,
          child: Container(
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
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('/post',arguments:cardData);
              },
              child: Column(
                children: <Widget>[
                  /**
                   * Card Top
                   * ----------
                   * Post ID and Options
                   */
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Post ID

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
                                size: 18.0,
                              )
                            ],
                          ),
                        ),

                        PopupMenuButton<String>(
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child:Icon(Icons.more_horiz)  
                          ),
                          onSelected: postAction,
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            PopupMenuItem(
                              value: "report",
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.block,size: 18),
                                  SizedBox(width: 6),
                                  Text('Report'),
                                ],
                              )
                            ),
                            PopupMenuItem(
                              value: "savepost",
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.bookmark,size: 16),
                                  SizedBox(width: 4),
                                  Text('Save Post'),
                                ],
                              )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  /**
                   * Card Title & Icon    
                   * ----------
                   */

                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        // Card Title
                        Expanded(
                          child: Text(
                            cardData.title,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                                color: cardData.cardTemplate.titleColor),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Image.asset(
                          cardData.thumbAddress,
                          width: 50.0,
                        )
                      ],
                    ),
                  ),

                  /**
                   * 
                   * Messages & Times
                   * 
                   */
                  Expanded(
                      child: OverflowBox(
                          maxHeight: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              /**
                           * Initial Message Card
                           * --------------------
                           */
                              
                              CardMessageBox(
                                message:cardData.messages.first,
                                cardTemplate: cardData.cardTemplate,
                              ),

                              if(cardData.messages.length > 1)
                              ...[
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 22.0, right: 22.0, top: 4.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text("LATEST UPDATE",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: cardData.cardTemplate.subtextColor,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 5),
                                      if(cardData.messages.length > 2)
                                      Text("( "+(cardData.messages.length - 1 ).toString()+" TOTAL UPDATES)",
                                          style: TextStyle(
                                              fontSize: 9.0,
                                              color: cardData.cardTemplate.subtextColor))
                                    ],
                                  ),
                                ),
        
                                CardMessageBox(
                                  message:cardData.messages.last,
                                  cardTemplate: cardData.cardTemplate,
                                ),

                              ]


                              /**
                           * Update Message Card
                           * --------------------
                           */

                            ],
                          ))),

                  /**
                   * Requester Details & Contacts
                   * -----------------------------
                   */

                  Container(
                    margin: EdgeInsets.only(left: 22.0, right: 22.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        // Requester Details

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("REQUESTER",
                                  style: TextStyle(
                                      color: cardData.cardTemplate.miniTitleColor,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500)),
                              Text(cardData.requesterName,
                                  style: TextStyle(
                                      color: cardData.cardTemplate.subtextColor,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500)),
                              if(cardData.requesterTitle != null)
                              Text(cardData.requesterTitle,
                                  style: TextStyle(
                                      color: cardData.cardTemplate.subtextColor,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text("CONTACT",
                                  style: TextStyle(
                                      color: cardData.cardTemplate.miniTitleColor,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500)),

                              ...List.generate(cardData.contacts.length,(i)=>
                                Text(cardData.contacts[i],
                                    style: TextStyle(
                                        color: cardData.cardTemplate.subtextColor,
                                        fontSize: i==0?12.0:11.5,
                                        fontWeight: FontWeight.w500)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /**
                   *   Verified By
                   *   -------------
                   */

                  if(cardData.verification != null)
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0x0A000000),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              if(cardData.isVerified)
                              ...[
                                Icon(
                                  Icons.verified_user,
                                  color: cardData.cardTemplate.footerTextColor,
                                  size: 12.0,
                                ),
                                SizedBox(width: 1),
                              ],
                              Text(
                                cardData.verification,
                                style: TextStyle(
                                  color: cardData.cardTemplate.footerTextColor,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                              ),
                            ])),
                ],
              ),
            ),
          ),
    );
  }
}

class CardMessageBox extends StatelessWidget {
  final CardMessage message;
  final CardTemplate cardTemplate;

  const CardMessageBox(
      {Key key, this.message, this.cardTemplate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5.0),
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
