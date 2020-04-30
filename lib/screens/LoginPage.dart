import 'package:flutter/material.dart';
import 'package:itstrue/data/logic/firebase.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  ///
  /// Variables
  ///

  String _errorMessage;
  String _otpCode;
  String _phoneNumber;
  bool _isOtpSent;

  final _auth = FireBaseUser();

  ///
  /// Initial State
  ///


  @override
  void initState() {
    _errorMessage = null;
    _isOtpSent =  false;
  }


  ///
  /// Methods
  ///
  

  void submitPhoneNumber(){

  }




  ///
  /// Widgets
  ///





  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign in to Your Account or Create One",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),


                

                // Show Errors
                (

                  _errorMessage != null ?
                  // If any arror Message
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.error_outline,
                            color: Color(0xFFBB0000), size: 14),
                        SizedBox(width: 5),
                        Text(
                          _errorMessage,
                          style: TextStyle(
                            color: Color(0xFFBB0000),
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  )
                  :
                  SizedBox(height: 20)
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
                  child: _isOtpSent == false?phoneField():otpFeild(),
                ),

                
                SizedBox(height: 20),

                (
                  _isOtpSent == false?
                  RaisedButton(
                    onPressed: () {
                      
                      if(this._phoneNumber == null || this._phoneNumber.length != 10){
                        setState(() {
                          _errorMessage = "Enter a valid 10 digit number";
                        });
                      }
                      else{
                        _errorMessage = null;
                        _auth.verifyPhone(this._phoneNumber);

                        setState(() {
                          _isOtpSent = true;  
                        });

                      }
                    },

                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text('Get One Time Password', style: TextStyle(fontSize: 15)),
                  )
                
                  :
                  

                  RaisedButton(
                    onPressed: () async {
                      
                      var a = _auth.loginStatus();
                      try {
                        await _auth.signIn(this._otpCode);
                        Navigator.of(context).pushReplacementNamed('/setup_profile');
                      } catch (e) {
                          setState(() {
                            if(e.code == "ERROR_INVALID_VERIFICATION_CODE")
                            {
                              _errorMessage = "Invalid OTP";
                            }
                            else{
                              _errorMessage = "Login Error. " + e.message;                              
                            }
                          });
                        print("LoginError : " + e.code);

                      }

                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text('Login', style: TextStyle(fontSize: 15)),
                  )
                  
                ),


                
              ])),
    );
  }

  Container phoneField() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: TextField(
            key: UniqueKey(),
            onChanged: (value) {
              this._phoneNumber = value;
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
                prefixText: '+91 ')));
  }
  Container otpFeild() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: TextField(
            key: UniqueKey(),
            onChanged: (value) {
              this._otpCode = value;
            },
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 15.0,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.lock_outline, color: Colors.black, size: 18),
                hintText: 'Enter Six Digit OTP',
                )));
  }
}
