import 'package:flutter/material.dart';
import 'package:itstrue/data/logic/firebase.dart';

class LoginPage extends StatelessWidget {
  String errorMessage;
  String code;
  String PhoneNumber;
  final _auth = FireBaseUser();

  @override
  void initState() {
    errorMessage = null;
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign in to Your Account",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.error_outline,
                          color: Color(0xFFBB0000), size: 14),
                      SizedBox(width: 5),
                      Text(
                        "Login faild. Credentials does't match",
                        style: TextStyle(
                          color: Color(0xFFBB0000),
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
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
                  child: phoneField(),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    _auth.verifyPhone(this.PhoneNumber);
                    smsCodeDialog(context).then((value) {
                      print('Signed in');
                    });
                  },
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text('Login', style: TextStyle(fontSize: 15)),
                ),
              ])),
    );
  }

  Container phoneField() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: TextField(
            maxLength: 10,
            onChanged: (value) {
              this.PhoneNumber = value;
            },
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 15.0,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.phone, color: Colors.black, size: 18),
                hintText: 'Enter Phone Number',
                prefixText: '+91')));
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter OTP'),
            content: TextField(
              onChanged: (value) {
                this.code = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Text('Done', style: TextStyle(fontSize: 15)),
                onPressed: () {
                  var a = _auth.loginStatus();
                  if (a == true) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  } else {
                    Navigator.of(context).pop();
                    _auth.signIn(this.code);
                  }
                },
              )
            ],
          );
        });
  }
}
