import 'package:flutter/material.dart';
import 'package:itstrue/data/class/CardModel.dart';
import 'package:itstrue/screens/components/CardMessageBox.dart';


class SharableCard extends StatelessWidget {
  final CardModel cardData;
  SharableCard({Key key, this.cardData}) : super(key: key);  


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor
      ),
      child: AspectRatio(
        aspectRatio: 4/5,    
        child: FractionallySizedBox(
          widthFactor: 0.95,
          alignment: Alignment.center,
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
                borderRadius: BorderRadius.all(Radius.circular(10.0))    
            ),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Column(
              children: <Widget>[
                /**
                 * Card Top
                 * ----------
                 * Post ID and Options
                 */
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      SizedBox(width: 10),
                      Expanded(
                        child:RichText(
                          text:TextSpan(
                            style: TextStyle(fontSize: 9,color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text:"To verify this message and get latest update,\n download ",
                              ),
                              TextSpan(
                                text:"Unfake App ",
                                style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black)
                              ),
                              TextSpan(
                                text:"and enter this ID",
                              )
                            ],
                          )
                        ),
                      ),
                      
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
                          "കൊച്ചി അമൃതയിലേക്ക് A+ രക്തം ആവശ്യമുണ്ട്",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: cardData.cardTemplate.titleColor),
                        ),
                      ),
                      if(cardData.thumbnail != null)
                        ...[
                          SizedBox(width: 10.0),
                          Image.asset(
                            cardData.thumbAddress,
                            width: 50.0,
                          ),
                        ]

                    ],
                  ),
                ),



                SizedBox(height: 10),
                
                

                /**
                 * 
                 * Messages & Times
                 * 
                 */
                Column(
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




                    /**
                     * Update Message Card
                     * --------------------
                     */


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


                  ],
                ),


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
      ),
    );
  }
}
