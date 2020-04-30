import 'package:flutter/material.dart';
import 'package:itstrue/data/logic/controller.dart';
import 'package:itstrue/data/class/CardModel.dart';
import 'package:itstrue/screens/components/MiniCard.dart';


class SavedPostsPage extends StatelessWidget {
  @override
  final _dataHandler = DataHandler();

  @override

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

                  FutureBuilder(
                    future: _dataHandler.getSavedPosts(),
                    builder: (BuildContext context,snap){
                      if(snap.connectionState == ConnectionState.done){
                        List postIds = snap.data;
                        
                        return Column(
                          children:postIds.map((id)=>
                            FutureBuilder(
                              future: _dataHandler.getCardFromId(id),
                              builder: (BuildContext context,snapshot){
                                if(snapshot.connectionState == ConnectionState.done){
                                  CardModel cardData = snapshot.data;
                                  return MiniCard(cardData:cardData);
                                }
                                else{
                                  return Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: EdgeInsets.all(30),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xFFEEEEEE)
                                    ),
                                  );
                                }
                                
                              },
                            )
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
