import 'package:flutter/material.dart';
import 'package:itstrue/screens/LoginPage.dart';


//Components
import 'components/HomeCarousel.dart';
import 'components/BottomNavBar.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Theme.of(context).backgroundColor,
      
      body: SafeArea(
        child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                // Header

                Padding(
                  padding: const EdgeInsets.only(top:15.0,left: 15.0,right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/unfake-logo.png'),
                        height: 25.0,
                      ),
                      FlatButton(
                        child:CircleAvatar(
                          backgroundImage: AssetImage('assets/images/avatar.png'),

                        ),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
    );}
                      )

                    ],
                  ),
                ),
                
                // Search Box
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:20.0,horizontal:20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:15.0,right: 10.0),
                        child: new TextField(
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            border:InputBorder.none,
                            hintText: 'Search Using Post ID',
                            suffixIcon: Icon(Icons.search),
                          )
                        ),
                      ),
                    ),
                  ),
                ),


                // Card List

                Container(
                  alignment: Alignment.center,
                  child: HomeCarousel()
                )



            ],
          ),
        ),
      ),
      
      
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Create New Post',
        child: Icon(Icons.add,size: 30.0),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );  
  }
}

