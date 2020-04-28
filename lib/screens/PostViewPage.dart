import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:esys_flutter_share/esys_flutter_share.dart';

import 'package:itstrue/data/class/CardModel.dart';
import 'package:itstrue/screens/components/SharableCard.dart';
import 'package:itstrue/screens/components/CardMessageBox.dart';

class PostViewPage extends StatefulWidget {
  final CardModel cardData;
  PostViewPage({this.cardData});

  @override
  _PostViewPageState createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  bool _viewUpdates;

  CardModel cardData;

  @override
  void initState() {
    _viewUpdates = false;
    cardData = widget.cardData;
    super.initState();
  }

  void _showUpdateHistory() {
    setState(() {
      _viewUpdates = true;
    });
  }

  void _newUpdate() async {
    String newUpdateText;
    await showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
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

  void postAction(String action) {
    print(action);

    switch (action) {
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
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    await Share.file(
        'Unfake', 'unfake.png', byteData.buffer.asUint8List(), 'image/png',
        text: 'PostID:*'+cardData.postId+'* - Created Using UnfakeApp');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: <Widget>[
        RepaintBoundary(
            key: _globalKey, child: SharableCard(cardData: cardData)),
        Positioned.fill(child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          width: MediaQuery.of(context).size.width,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10.0, vertical: 5)
                                  .copyWith(bottom: 50),
                          child: Column(
                            children: <Widget>[
                              /**
                             * Card Top
                             * ----------
                             * Post ID and Options
                             */
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    // Post ID

                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 3.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
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
                                          if (cardData.isVerified)
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
                                      onPressed: () {
                                        postAction("share");
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text('Share',
                                              style:
                                                  TextStyle(color: Colors.black)),
                                          SizedBox(width: 5),
                                          Icon(Icons.share,
                                              size: 13, color: Colors.black),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 10),

                                    PopupMenuButton<String>(
                                      icon: Icon(Icons.more_horiz),
                                      onSelected: postAction,
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<String>>[
                                        PopupMenuItem(
                                            value: "report",
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.block, size: 18),
                                                SizedBox(width: 6),
                                                Text('Report'),
                                              ],
                                            )),
                                        PopupMenuItem(
                                            value: "savepost",
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.bookmark, size: 16),
                                                SizedBox(width: 4),
                                                Text('Save Post'),
                                              ],
                                            )),
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
                                padding: EdgeInsets.only(
                                    left: 20.0, right: 20.0, bottom: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    // Card Title
                                    Expanded(
                                      child: Text(
                                        cardData.title,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                cardData.cardTemplate.titleColor),
                                      ),
                                    ),
                                    if (cardData.thumbnail != null) ...[
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
                                children: <Widget>[
                                  /**
                             * Initial Message Card
                             * --------------------
                             */

                                  /**
                                 * Initial Message Card
                                 * --------------------
                                 */

                                  CardMessageBox(
                                    message: cardData.messages.first,
                                    cardTemplate: cardData.cardTemplate,
                                  ),

                                  /**
                                 * Update Message Card
                                 * --------------------
                                 */

                                  if (cardData.messages.length > 1) ...[
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 22.0, right: 22.0, top: 4.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text("LATEST UPDATE",
                                              style: TextStyle(
                                                  fontSize: 10.0,
                                                  color: cardData
                                                      .cardTemplate.subtextColor,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(width: 5),
                                          if (cardData.messages.length > 2)
                                            Text(
                                                "( " +
                                                    (cardData.messages.length - 1)
                                                        .toString() +
                                                    " TOTAL UPDATES)",
                                                style: TextStyle(
                                                    fontSize: 9.0,
                                                    color: cardData.cardTemplate
                                                        .subtextColor))
                                        ],
                                      ),
                                    ),
                                    CardMessageBox(
                                      message: cardData.messages.last,
                                      cardTemplate: cardData.cardTemplate,
                                    ),
                                  ],

                                  /**
                               * Update History
                               * --------------------
                               */
                                  if (_viewUpdates)
                                    ...cardData.messages
                                        .sublist(1, cardData.messages.length - 1)
                                        .map((msg) => CardMessageBox(
                                              message: cardData.messages.last,
                                              cardTemplate: cardData.cardTemplate,
                                              important: false,
                                            ))
                                        .toList(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        OutlineButton(
                                          borderSide: BorderSide(
                                            color: cardData
                                                .cardTemplate.footerTextColor,
                                          ),
                                          onPressed: _newUpdate,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Icon(Icons.add_alert,
                                                  size: 15,
                                                  color: cardData.cardTemplate
                                                      .footerTextColor),
                                              SizedBox(width: 4),
                                              Text("ADD UPDATE",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: cardData.cardTemplate
                                                          .footerTextColor))
                                            ],
                                          ),
                                        ),
                                        if (_viewUpdates == false &&
                                            cardData.messages.length > 2) ...[
                                          SizedBox(width: 10),
                                          OutlineButton(
                                            borderSide: BorderSide(
                                              color: cardData
                                                  .cardTemplate.footerTextColor,
                                            ),
                                            onPressed: _showUpdateHistory,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Icon(Icons.access_time,
                                                    size: 15,
                                                    color: cardData.cardTemplate
                                                        .footerTextColor),
                                                SizedBox(width: 4),
                                                Text("UPDATE HISTORY",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: cardData
                                                            .cardTemplate
                                                            .footerTextColor))
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

                              Container(
                                margin: EdgeInsets.only(
                                    left: 22.0, right: 22.0, bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    // Requester Details

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("REQUESTER",
                                              style: TextStyle(
                                                  color: cardData.cardTemplate
                                                      .miniTitleColor,
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w500)),
                                          Text(cardData.requesterName,
                                              style: TextStyle(
                                                  color: cardData
                                                      .cardTemplate.subtextColor,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w500)),
                                          if (cardData.requesterTitle != null)
                                            Text(cardData.requesterTitle,
                                                style: TextStyle(
                                                    color: cardData.cardTemplate
                                                        .subtextColor,
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text("CONTACT",
                                              style: TextStyle(
                                                  color: cardData.cardTemplate
                                                      .miniTitleColor,
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w500)),
                                          ...List.generate(
                                            cardData.contacts.length,
                                            (i) => Text(cardData.contacts[i],
                                                style: TextStyle(
                                                    color: cardData.cardTemplate
                                                        .subtextColor,
                                                    fontSize:
                                                        i == 0 ? 12.0 : 11.5,
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

                              if (cardData.verification != null)
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Color(0x0A000000),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          if (cardData.isVerified) ...[
                                            Icon(
                                              Icons.verified_user,
                                              color: cardData
                                                  .cardTemplate.footerTextColor,
                                              size: 12.0,
                                            ),
                                            SizedBox(width: 1),
                                          ],
                                          Text(
                                            cardData.verification,
                                            style: TextStyle(
                                              color: cardData
                                                  .cardTemplate.footerTextColor,
                                              fontSize: 9,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ])),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )),
      ]),
    );
  }
}
