import 'dart:async';
import 'dart:typed_data';

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// import 'package:itstrue/controllers/CardRenderer.dart';

import 'templates/CardTemplate.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';


import 'components/SharableCard.dart';

class PostViewPage extends StatefulWidget {
  
  @override
  _PostViewPageState createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {

  bool _viewUpdates;
  
  
  final CardTemplate cardTemplate = new CardTemplate.redCard();

  void _showUpdateHistory(){
    setState(() {
      _viewUpdates = true;
    });
  }
  
  void _newUpdate() async{
    String newUpdateText;
    await showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update the Post'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                maxLines: null,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Enter Update Message',
                  ),
                onChanged: (value) {
                  newUpdateText = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('UPDATE'),
              onPressed: () {
                Navigator.of(context).pop(newUpdateText);
              },
            ),
          ],
        );
      },
    );
  }

  @override void initState() {
    _viewUpdates = false;
    super.initState();
  }

  void postAction(String action) {
    print(action);

    switch(action){
      case "share":
        _shareCardImage();
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
    ///   There is a copy of this function in carousel card
    ///
    
  }
  
  GlobalKey _globalKey = new GlobalKey();

  Future<void> _shareCardImage() async {
    RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    await Share.file('Unfake', 'unfake.png', byteData.buffer.asUint8List(), 'image/png', text: '*APZ2123* - Created Using UnfakeApp');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: SingleChildScrollView(
            child: Stack(
              children:<Widget>[
                RepaintBoundary(
                  key:_globalKey,
                  child: SharableCard(cardTemplate: cardTemplate)
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor
                  ),
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
                          image: AssetImage(cardTemplate.bgImage),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))    
                    ),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5).copyWith(bottom:50),
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
                                      "APZ2123",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.brown,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.verified_user,
                                      color: Colors.green,
                                      size: 18.0,
                                    )
                                  ],
                                ),
                              ),

                              Expanded(
                                child: Container(),
                              ),
                              
                              OutlineButton(
                                onPressed: (){
                                  postAction("share");
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text('Share',style: TextStyle(color: Colors.black)),
                                    SizedBox(width:5),
                                    Icon(Icons.share ,size: 13,color: Colors.black),                          
                                  ],
                                ),
                              ),

                              SizedBox(width: 10),
                              


                              PopupMenuButton<String>(
                                icon: Icon(Icons.more_horiz),
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
                                  "കൊച്ചി അമൃതയിലേക്ക് A+ രക്തം ആവശ്യമുണ്ട്",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700,
                                      color: cardTemplate.titleColor),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Image.asset(
                                'assets/images/demo/blood_icon_red.png',
                                width: 60.0,
                              )
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
                          children: <Widget>[
                            /**
                         * Initial Message Card
                         * --------------------
                         */

                            CardMessageBox(
                              message:
                                  "കൊച്ചി അമൃത ഹോസപിറ്റലിൽ  ആക്സിഡന്‍റ് ആയി കിടക്കുന്ന യുവാവിന് നാല് കൂപ്പി A+ ബ്ലഡ് ആവശ്യമുണ്ട്‌. ",
                              date: "12 MARCH 2020",
                              time: "09:53 PM",
                              cardTemplate: cardTemplate,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 22.0, right: 22.0, top: 4.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text("LATEST UPDATE",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: cardTemplate.subtextColor,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 5),
                                  Text("( 2 TOTAL UPDATES)",
                                      style: TextStyle(
                                          fontSize: 9.0,
                                          color: cardTemplate.subtextColor))
                                ],
                              ),
                            ),

                            /**
                           * Update Message Card
                           * --------------------
                           */

                            CardMessageBox(
                              message:
                                  "രക്തം നല്‍കാന്‍ തയ്യാറായി 2 പേർ വന്നിട്ടുണ്ട്. 2 പേരെ കൂടി ആവശ്യമുണ്ട്",
                              date: "13 MARCH 2020",
                              time: "12:17 PM",
                              cardTemplate: cardTemplate,
                            ),


                            /**
                           * Update History
                           * --------------------
                           */                            
                            if(_viewUpdates)
                              ...[
                                CardMessageBox(
                                  message:"രക്തം നല്‍കാന്‍ ഒരാള്‍ വന്നിട്ടുണ്ട്. 3 പേരെ കൂടി ആവശ്യമുണ്ട്",
                                  date: "13 MARCH 2020",
                                  time: "10:48 AM",
                                  cardTemplate: cardTemplate,
                                  important: false,
                                )
                              ]
                            ,


                            Padding(
                              padding: EdgeInsets.symmetric(vertical:5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:<Widget>[
                                  OutlineButton(
                                    borderSide: BorderSide(
                                      color: cardTemplate.footerTextColor,
                                    ),
                                    onPressed: _newUpdate,
                                    child:Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Icon(Icons.add_alert,size: 15,color: cardTemplate.footerTextColor),
                                        SizedBox(width: 4),
                                        Text("ADD UPDATE",style: TextStyle(fontSize: 11,color: cardTemplate.footerTextColor))
                                      ],
                                    ),
                                  ),
                                  
                                  if(_viewUpdates == false)
                                    ...[
                                      SizedBox(width: 10),
                                      OutlineButton(
                                        borderSide: BorderSide(
                                          color: cardTemplate.footerTextColor,
                                        ),
                                        onPressed: _showUpdateHistory,
                                        child:Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(Icons.access_time,size: 15,color: cardTemplate.footerTextColor),
                                            SizedBox(width: 4),
                                            Text("UPDATE HISTORY",style: TextStyle(fontSize: 11,color: cardTemplate.footerTextColor))
                                          ],
                                        ),
                                      ),
                                    ]
                                ],
                              ),
                            ),
                                            
                            
                          ],
                        ),

                        /**
                         * Requester Details & Contacts
                         * -----------------------------
                         */

                        SizedBox(height: 20),

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
                                            color: cardTemplate.miniTitleColor,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500)),
                                    Text("Reyn Mathew",
                                        style: TextStyle(
                                            color: cardTemplate.subtextColor,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500)),
                                    Text("Co Ordinator Kerala Blood Donors Group",
                                        style: TextStyle(
                                            color: cardTemplate.subtextColor,
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
                                            color: cardTemplate.miniTitleColor,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500)),
                                    Text("+91 9876543210",
                                        style: TextStyle(
                                            color: cardTemplate.subtextColor,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500)),
                                    Text("+91 9956858388",
                                        style: TextStyle(
                                            color: cardTemplate.subtextColor,
                                            fontSize: 11.5,
                                            fontWeight: FontWeight.w500)),
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
                            padding: EdgeInsets.symmetric(vertical: 8),
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
                                ])),
                      ],
                    ),
                  ),
                ),
              ]
            )
          ),
    );
  }
}




class CardMessageBox extends StatelessWidget {
  final String message;
  final String date;
  final String time;
  final CardTemplate cardTemplate;
  final bool important;

  const CardMessageBox(
      {Key key, this.message, this.date, this.time, this.cardTemplate,this.important = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB( (important?22.0:50) , 5.0 , 22.0  ,  5.0),
      child: Column(
        children: <Widget>[
          // Card Content

          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            decoration: BoxDecoration(
                color: cardTemplate.messageBoxColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: Text(
              this.message,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: cardTemplate.messageColor),
            ),
          ),

          // Posted Time

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this.date + " ",
                  style: TextStyle(fontSize: 8.0, color: Color(0xCC000000))),
              Icon(Icons.access_time, size: 9.0, color: Color(0xCC000000)),
              Text(" " + this.time,
                  style: TextStyle(fontSize: 8.0, color: Color(0xCC000000)))
            ],
          )
        ],
      ),
    );
  }
}
