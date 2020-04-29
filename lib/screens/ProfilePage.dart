import 'package:flutter/material.dart';
import 'package:itstrue/data/logic/controller.dart';
import 'package:itstrue/data/class/CardModel.dart';
import 'package:itstrue/screens/components/MiniCard.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _dataHandler = DataHandler();

  String _username;
  @override
  void initState() {
    _dataHandler.getUserName().then((username){
      setState(() {
        _username = username;
      });
    });
    super.initState();
  }  

  @override
  Widget build(BuildContext context) {

    _dataHandler.loginStatus().then((isLoggedIn){
      if(isLoggedIn == false){
          Navigator.of(context).pushReplacementNamed('/login');
      }
    });

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      
                      if(_username != null)
                      Text(
                        "Hi " + _username,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black
                        ),
                      ),


                      Expanded(child: new Container()),


                      RaisedButton.icon(
                        onPressed: () {
                          _dataHandler.signOut();
                          Navigator.of(context).pushNamed('/login');
                        },
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        icon:Icon(Icons.lock_open,size: 16),
                        label: const Text(
                            'Sign out',
                            style: TextStyle(fontSize: 14)
                        ),
                      )
                      
                      
                    ],
                  ),

                  SizedBox(height: 30),

                  FutureBuilder(
                    future: _dataHandler.getUserPosts(),
                    builder: (BuildContext context,snap){
                      if(snap.connectionState == ConnectionState.done){
                        List<CardModel> cards = snap.data;
                        return Column(
                          children:cards.map((cardData)=>
                            MiniCard(cardData:cardData,showName: false)
                          ).toList()
                          
                        );
                      }
                      else{
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  )




                ]
            )
        ),
      ),
    );
  }
}
