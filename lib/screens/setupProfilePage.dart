import 'package:flutter/material.dart';
import 'package:itstrue/data/logic/controller.dart';

class SetupProfilePage extends StatelessWidget {
  final data = DataHandler();
  final name = TextEditingController();
  final designation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Setup your Profile",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  SizedBox(height: 60),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3,
                              offset: Offset(0, 3))
                        ]),
                    child: Column(
                      children: <Widget>[
                        nameField(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    onPressed: () {
                      if(name.text.length !=0)
                        {
                          data.writeProfile(name.text);
                          Navigator.of(context).pushReplacementNamed('/home');
                        }

                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text('Done', style: TextStyle(fontSize: 15)),
                  ),
                ])),
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
            )));
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
              prefixIcon:
                  Icon(Icons.description, color: Colors.black, size: 18),
              hintText: 'Enter your Designation',
            )));
  }
}
