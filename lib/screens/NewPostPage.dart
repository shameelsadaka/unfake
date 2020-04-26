import 'package:flutter/material.dart';


import 'templates/CardTemplate.dart';

class NewPostPage extends StatefulWidget {
  
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  
  final List<CardTemplate> _cardTemplates = [
      new CardTemplate.redCard(),
      new CardTemplate.blueCard(),
      new CardTemplate.greenCard(),
      new CardTemplate.yellowCard(),
      new CardTemplate.cyanCard(),
  ];
  
  CardTemplate _cardTemplate;


  final _formKey = GlobalKey<FormState>();

  @override void initState() {
    super.initState();
    _cardTemplate = _cardTemplates[0];
  }

  void _createNewPost(){

  }
  

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
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
                  image: AssetImage(_cardTemplate.bgImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Form(
                key: _formKey,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  
                  
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Text("Create New Post",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                      )
                    ),
                  ),
                  
                  
                  
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal:14),
                            decoration: BoxDecoration(
                              color: Color(0x0A000000), 
                              borderRadius: BorderRadius.circular(8)

                            ),
                            child:TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                              keyboardType: TextInputType.text,
                              minLines: 1,
                              maxLines: 3,
                              decoration: InputDecoration(
                                labelText: 'Post Title',
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54 
                                ),
                              ),
                            )
                          ),
                        ),
                        SizedBox(width: 10.0),
                        FlatButton(
                          onPressed: (){
                            // Display Icons
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.add,size: 25,color: Colors.black54),
                              SizedBox(height: 2),
                              Text("Add Icon",style: TextStyle(color: Colors.black54,fontSize: 12))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                
                  SizedBox(height: 15),
                  
                  
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal:14),
                    decoration: BoxDecoration(
                      color: Color(0x0A000000), 
                      borderRadius: BorderRadius.circular(8)

                    ),
                    child:TextFormField(
                      style: TextStyle(
                          color: Colors.black
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 10,
                      decoration: InputDecoration(
                        labelText: 'Message',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54 
                        ),
                      ),
                    )
                  ),




                  ///
                  /// Templates
                  ///




                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child:Text("Template",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                      )
                    ),
                  ),
                  SizedBox(height: 10),
                  
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: _cardTemplates.map((template) => 
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _cardTemplate = template;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.only(right:15),
                            decoration: new BoxDecoration(
                              color: template.blockColor,
                              border: identical(_cardTemplate,template)?Border.all(width: 2.0, color: Color(0x55F000000)):null,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      ).toList()
                    ),
                  ),
                  SizedBox(height: 20),




                  ///
                  /// Requester
                  ///


                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child:Text("Requester Details",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                      )
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child:TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Requester Name',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.black54 )
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.black54 )
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ),


                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child:TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Designation (Optional)',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.black54 )
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.black54 )
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child:TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.black54 )
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.black54 )
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ),

                  
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child:TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Second Phone Number (Optional)',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black54)
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black54)
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ),

                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.center,
                    child: OutlineButton(
                      borderSide: BorderSide(
                        color: _cardTemplate.footerTextColor,
                      ),
                      onPressed: _createNewPost,
                      child:Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("CREATE NEW POST",style: TextStyle(fontSize: 12,color: _cardTemplate.footerTextColor)),
                          SizedBox(width: 4),
                          Icon(Icons.send,size: 15,color: _cardTemplate.footerTextColor),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40)
                ],
              ),
            ),
          )
      ),
    );
  }
}