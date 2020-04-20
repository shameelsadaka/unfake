import 'package:flutter/material.dart';
import '../templates/CardTemplate.dart';

class CarouselCard extends StatelessWidget {

  final CardTemplate cardTemplate;
  
  CarouselCard({
    Key key,
    this.cardTemplate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
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
              image: AssetImage(cardTemplate.bgImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Column(
            children: <Widget>[

              /**
               * Card Top
               * ----------
               * Post ID and Options
               */
              Container(
                padding: EdgeInsets.symmetric(horizontal:20.0,vertical:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    

                    // Post ID
                    
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white30
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "APZ2123",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.brown,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Icon(
                            Icons.verified_user,
                            color: Colors.green ,
                            size: 18.0,
                          )
                        ],
                      ),
                    ),


                    Icon(Icons.more_horiz)

                    
                  ],
                ),
              ),



              /**
               * Card Title & Icon    
               * ----------
               */
              

              Container(
                padding: EdgeInsets.only(left:20.0,right:20.0,bottom: 10.0),
                child: Row(
                  children: <Widget>[

                      // Card Title
                      Expanded(
                        child: Text(
                          "കൊച്ചി അമൃതയിലേക്ക് A+ രക്തം ആവശ്യമുണ്ട്",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            color: cardTemplate.titleColor
                          ),

                        ),
                      ),
                      SizedBox(width: 10.0),
                      Image.asset(
                        'assets/images/demo/blood_icon_red.png',
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
                  child:Column(
                    children: <Widget>[


                      

                      /**
                       * Initial Message Card
                       * --------------------
                       */

                      CardMessageBox(
                        message:"കൊച്ചി അമൃത ഹോസപിറ്റലിൽ  ആക്സിഡന്‍റ് ആയി കിടക്കുന്ന യുവാവിന് നാല് കൂപ്പി A+ ബ്ലഡ് ആവശ്യമുണ്ട്‌. ",
                        date:"12 MARCH 2020",
                        time:"09:53 PM",
                        cardTemplate: cardTemplate,
                      ),

    

                      Container(
                        margin: EdgeInsets.only(left:22.0,right:22.0,top:4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("LATEST UPDATE",style: TextStyle(fontSize: 10.0,color: cardTemplate.subtextColor,fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            Text("( 2 TOTAL UPDATES)",style: TextStyle(fontSize:  9.0,color: cardTemplate.subtextColor))
                          ],
                        ),
                      ),
                      
                      
                      /**
                       * Update Message Card
                       * --------------------
                       */
                      

                      CardMessageBox(
                        message:"രക്തം നല്‍കാന്‍ തയ്യാറായി 2 പേർ വന്നിട്ടുണ്ട്. 2 പേരെ കൂടി ആവശ്യമുണ്ട്",
                        date:"13 MARCH 2020",
                        time:"12:17 PM",
                        cardTemplate: cardTemplate,
                      ),



                    ],
                  )
                )
              ),




              /**
               * Requester Details & Contacts
               * -----------------------------
               */


              Container(
                margin: EdgeInsets.only(left:22.0,right:22.0,bottom:15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    
                    // Requester Details
                    
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("REQUESTER",style: TextStyle(color:cardTemplate.miniTitleColor,fontSize: 10.0,fontWeight: FontWeight.w500)),
                          Text("Reyn Mathew",style: TextStyle(color:cardTemplate.subtextColor,fontSize: 13.0,fontWeight: FontWeight.w500)),
                          Text("Co Ordinator Kerala Blood Donors Group",style: TextStyle(color:cardTemplate.subtextColor,fontSize: 9,fontWeight: FontWeight.w500)),
                          
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text("CONTACT",style: TextStyle(color:cardTemplate.miniTitleColor,fontSize: 10.0,fontWeight: FontWeight.w500)),
                          Text("+91 9876543210",style: TextStyle(color:cardTemplate.subtextColor,fontSize: 12.0,fontWeight: FontWeight.w500)),                          
                          Text("+91 9956858388",style: TextStyle(color:cardTemplate.subtextColor,fontSize: 11.5,fontWeight: FontWeight.w500)),                          
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

              
              Container(
                padding: EdgeInsets.symmetric(vertical:8),
                decoration: BoxDecoration(
                  color: Color(0x0A000000),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.verified_user,
                      color: cardTemplate.footerTextColor,
                      size: 12.0,
                    ),
                    SizedBox(width: 1),
                    Text(
                      "VERIFIED BY UNFAKE VOLUNTEER",
                      style: TextStyle(
                        color: cardTemplate.footerTextColor,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ]
                )
              ),
              



            ],
          ),
        );
      },
    );
  }
}









class CardMessageBox extends StatelessWidget {

  final String message;
  final String date;
  final String time;
  final CardTemplate cardTemplate;
  

  
  const CardMessageBox({
    Key key,
    this.message,
    this.date,
    this.time,
    this.cardTemplate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:22.0,vertical:5.0),
      child: Column(
        children: <Widget>[

          // Card Content
          
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
            decoration: BoxDecoration(
              color:cardTemplate.messageBoxColor,
              borderRadius:BorderRadius.circular(8.0)
            ),
            child: Text(
              this.message,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: cardTemplate.messageColor
              ),

            ),
          ),
          
          // Posted Time
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this.date + " ",style: TextStyle(fontSize: 8.0,color: Color(0xCC000000))),
              Icon(Icons.access_time,size:9.0,color: Color(0xCC000000)),
              Text(" "+this.time,style: TextStyle(fontSize: 8.0,color: Color(0xCC000000)))
            ],
          )
        ],
      ),
    );
  }
}

