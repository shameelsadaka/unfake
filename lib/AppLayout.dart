import 'package:flutter/material.dart';

//Components
import 'screens/components/BottomNavBar.dart';
import 'screens/LoginPage.dart';
import 'screens/SignUpPage.dart';



class AppLayout extends StatelessWidget {
  
  final Widget body;
  
  Widget get getCurrentPage => body;
  
  const AppLayout({this.body});

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
                      Navigator.pushNamed(context, '/login');
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
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Create New Post',
        child: Icon(Icons.add, size: 30.0),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }



}