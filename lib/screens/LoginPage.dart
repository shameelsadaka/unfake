import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  

  final emailField = Container(
    margin: EdgeInsets.symmetric(horizontal: 5,vertical:3),
    child:TextField(
      style: TextStyle(
        fontSize: 15.0,
      ),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.email,color: Colors.black,size: 18),
        hintText: 'Email',
      )
    )
  );

  final passwordFeild = Container(
    margin: EdgeInsets.symmetric(horizontal: 5,vertical:3),
    child:TextField(
      style: TextStyle(
        fontSize: 15.0,
      ),
      obscureText: true,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.lock,color: Colors.black,size: 18),
        hintText: 'Password',
      )
    )
  );
  
  
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
                  margin: EdgeInsets.only(bottom:20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.error_outline,color: Color(0xFFBB0000),size: 14),
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
                    boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 3,offset:Offset(0,3) )]
                  ),
                  child: Column(
                    children: <Widget>[
                      emailField,
                      Divider(color: Colors.black26,height: 3),
                      passwordFeild          
                    ],
                  ),
                ),

                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 15)
                  ),
                )

                
                
              ]
            )
        ),
    );
  }
}