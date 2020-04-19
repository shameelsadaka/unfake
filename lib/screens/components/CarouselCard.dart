import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {

  final String bgcard;
  
  CarouselCard({
    Key key,
    this.bgcard
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
              image: AssetImage(bgcard),
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
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFC40C0C)
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


                      Container(
                        margin: EdgeInsets.symmetric(horizontal:22.0,vertical:4.0),
                        child: Column(
                          children: <Widget>[

                            // Card Content
                            
                            Container(
                              margin: EdgeInsets.only(bottom: 5.0),
                              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
                              decoration: BoxDecoration(
                                color:Color(0x10FF0027),
                                borderRadius:BorderRadius.circular(8.0)
                              ),
                              child: Text(
                                "കൊച്ചി അമൃത ഹോസപിറ്റലിൽ  ആക്സിഡന്‍റ് ആയി കിടക്കുന്ന യുവാവിന് നാല് കൂപ്പി A+ ബ്ലഡ് ആവശ്യമുണ്ട്‌. ",
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFFAE3031)
                                ),

                              ),
                            ),
                            
                            // Posted Time
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("12 MARCH 2020 ",style: TextStyle(fontSize: 9.0,color: Color(0xCC000000))),
                                Icon(Icons.access_time,size:10.0,color: Color(0xAA000000)),
                                Text(" 05:23 PM",style: TextStyle(fontSize: 9.0,color: Color(0xCC000000)))
                              ],
                            )
                          ],
                        ),
                      ),



    

                      Container(
                        margin: EdgeInsets.symmetric(horizontal:22.0,vertical:5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("LATEST UPDATE",style: TextStyle(fontSize: 12.0,color: Color(0xFF880000),fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            Text("( 2 TOTAL UPDATES)",style: TextStyle(fontSize:  9.0,color: Color(0xFF880000)))
                          ],
                        ),
                      ),
                      
                      
                      /**
                       * Update Message Card
                       * --------------------
                       */
                      

                      Container(
                        margin: EdgeInsets.symmetric(horizontal:22.0,vertical:5.0),
                        child: Column(
                          children: <Widget>[

                            // Card Content
                            
                            Container(
                              margin: EdgeInsets.only(bottom: 5.0),
                              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
                              decoration: BoxDecoration(
                                color:Color(0x10FF0027),
                                borderRadius:BorderRadius.circular(8.0)
                              ),
                              child: Text(
                                "രക്തം നൽകാൻ തയ്യാറായി 2 പേർ വന്നിട്ടുണ്ട്. 2 പേരെ കൂടി ആവശ്യമുണ്ട്‌ ",
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFFAE3031)
                                ),

                              ),
                            ),
                            
                            // Posted Time
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("13 MARCH 2020 ",style: TextStyle(fontSize: 9.0,color: Color(0xCC000000))),
                                Icon(Icons.access_time,size:10.0,color: Color(0xAA000000)),
                                Text(" 05:23 PM",style: TextStyle(fontSize: 9.0,color: Color(0xCC000000)))
                              ],
                            )
                          ],
                        ),
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
                          Text("REQUESTER",style: TextStyle(color:Color(0x66880000),fontSize: 10.0,fontWeight: FontWeight.w500)),
                          Text("Reyn Mathew",style: TextStyle(color:Color(0xFF880000),fontSize: 13.0,fontWeight: FontWeight.w500)),
                          Text("Co Ordinator Kerala Blood Donors Group",style: TextStyle(color:Color(0xCC880000),fontSize: 9,fontWeight: FontWeight.w500)),
                          
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text("CONTACT",style: TextStyle(color:Color(0x66880000),fontSize: 10.0,fontWeight: FontWeight.w500)),
                          Text("+91 9876543210",style: TextStyle(color:Color(0xFF880000),fontSize: 13.0,fontWeight: FontWeight.w500)),                          
                          Text("+91 9956858388",style: TextStyle(color:Color(0xFF880000),fontSize: 12.5,fontWeight: FontWeight.w500)),                          
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
                      color: Color(0x99450404),
                      size: 12.0,
                    ),
                    SizedBox(width: 1),
                    Text(
                      "VERIFIED BY UNFAKE VOLUNTEER",
                      style: TextStyle(
                        color: Color(0x99450404),
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

