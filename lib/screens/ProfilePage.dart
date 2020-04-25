import 'package:flutter/material.dart';
import 'package:itstrue/data/logic/controller.dart';
class ProfilePage extends StatelessWidget {




final name = TextEditingController();
final data = DataHandler();
final designation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hello User",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 60),


                  Row(
                    children: <Widget>[
                      
                      RaisedButton.icon(
                        onPressed: () {
                          data.createCard();
                          print("Clicked on Add Post");
                        },
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        icon:Icon(Icons.add_comment,size: 18),
                        label: const Text(
                            'Add Posts',
                            style: TextStyle(fontSize: 15)
                        ),
                      ),


                      SizedBox(width: 10),


                      RaisedButton.icon(
                        onPressed: () {
                          data.signOut();
                          Navigator.of(context).pushNamed('/login');
                        },
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        icon:Icon(Icons.lock_open,size: 18),
                        label: const Text(
                            'Sign out',
                            style: TextStyle(fontSize: 15)
                        ),
                      )
                      
                      
                    ],
                  ),




                ]
            )
        ),
      ),
    );
  }
  Container nameField() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: TextField(
          controller: name,
            style: TextStyle(
              fontSize: 14.0,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.person, color: Colors.black, size: 18),
              hintText: 'Full Name',
            )
        )
    );
  }
  Container designationField() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: TextField(
          controller: designation,
            style: TextStyle(
              fontSize: 14.0,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.description, color: Colors.black, size: 18),
              hintText: 'Enter your Designation',
            )
        )
    );
  }
}
