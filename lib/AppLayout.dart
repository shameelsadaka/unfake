import 'package:flutter/material.dart';
import 'package:itstrue/data/logic/firebase.dart';

//Components
import 'screens/components/BottomNavBar.dart';
import 'screens/LoginPage.dart';



class AppLayout extends StatelessWidget {
  
  final Widget body;
  final bool newPostButton;
  Widget get getCurrentPage => body;
  
  const AppLayout({this.body,this.newPostButton = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            




            // Header
  
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/unfake-logo.png'),
                    height: 25.0,
                  ),
                  IconButton(

                    onPressed: (){
                      final _auth  = FireBaseUser();
                      _auth.loginStatus().then((isLoggedIn) {
                        if(isLoggedIn == true) {
                          Navigator.pushNamed(context, '/profile');
                        }
                        else{
                          Navigator.pushNamed(context, '/login');
                        }
                      });

                    },
                    icon: Icon(Icons.person,color: Colors.black,),
                  )
                ],
              ),
            ),



            (getCurrentPage)  // Return Current Page


            
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('/new_post');
        },
        tooltip: 'Create New Post',
        child: Icon(Icons.add, size: 30.0),
        backgroundColor: Theme.of(context).primaryColor,
      )
      ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }



}