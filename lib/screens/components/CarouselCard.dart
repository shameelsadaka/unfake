import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {

  final String bgcard;
  
  CarouselCard({
    Key key,
    this.bgcard
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(  
                color: Colors.black12,
                blurRadius: 4,
                offset: new Offset(0, 4.0),
              )
            ],
            image: DecorationImage(
              image: AssetImage(bgcard),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Column(
            children: <Widget>[

              /**
               * Card Top
               * ----------
               * Post ID and Options
               */
              Container(
                padding: EdgeInsets.symmetric(horizontal:20.0,vertical:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    

                    // Post ID
                    
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white30
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "APZ2123",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.brown,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Icon(
                            Icons.verified_user,
                            color: Colors.green ,
                            size: 18.0,
                          )
                        ],
                      ),
                    ),


                    Icon(Icons.more_horiz)

                    
                  ],
                ),
              )



              /**
               * Card Title & Icon
               * ----------
               */


            ],
          ),
        );
      },
    );
  }
}

