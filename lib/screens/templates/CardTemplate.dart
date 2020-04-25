import 'package:flutter/material.dart';
class CardTemplate {
 
  String _bgImageName;
 
  Color titleColor,messageBoxColor,messageColor,subtextColor,miniTitleColor,footerTextColor;



  // CardTemplate(); 
  factory CardTemplate.fromColor(String color){
    switch(color){
      case "red":
        return  CardTemplate.redCard(); 
      case "blue":
        return  CardTemplate.blueCard(); 
      case "green":
        return  CardTemplate.greenCard(); 
      case "yellow":
        return  CardTemplate.yellowCard(); 
      case "cyan":
        return  CardTemplate.cyanCard(); 
      default:
        return CardTemplate.redCard();
    }
  }


  // Card Templates

  CardTemplate.redCard(){
    this._bgImageName = 'red.png';    
    this.titleColor = Color(0xFFC40C0C);
    this.messageBoxColor = Color(0x10FF0027);
    this.messageColor = Color(0xFFAE3031);
    this.subtextColor = Color(0xFF880000);
    this.miniTitleColor = Color(0x66880000);
    this.footerTextColor =  Color(0x99450404);
  }  
  CardTemplate.blueCard(){
    this._bgImageName = 'blue.png';    
    this.titleColor = Color(0xFF480ead);
    this.messageBoxColor = Color(0x10480ead);
    this.messageColor = Color(0xFF240063);
    this.subtextColor = Color(0xFF4c07a6);
    this.miniTitleColor = Color(0x664c07a6);
    this.footerTextColor =  Color(0x9932035e);
  }
  CardTemplate.greenCard(){
    this._bgImageName = 'green.png';    
    this.titleColor = Color(0xFF045c2d);
    this.messageBoxColor = Color(0x100b7a29);
    this.messageColor = Color(0xFF006132);
    this.subtextColor = Color(0xFF045c2d);
    this.miniTitleColor = Color(0x66045c2d);
    this.footerTextColor =  Color(0x9908422d);
  }  
  CardTemplate.yellowCard(){
    this._bgImageName = 'yellow.png';    
    this.titleColor = Color(0xFFad6800);
    this.messageBoxColor = Color(0x10ad6800);
    this.messageColor = Color(0xFF6e4302);
    this.subtextColor = Color(0xFF6e5702);
    this.miniTitleColor = Color(0x666e5702);
    this.footerTextColor =  Color(0x994f441a);
  }
  CardTemplate.cyanCard(){
    this._bgImageName = 'cyan.png';    
    this.titleColor = Color(0xFF127ba1);
    this.messageBoxColor = Color(0x10127ba1);
    this.messageColor = Color(0xFF1e5878);
    this.subtextColor = Color(0xFF054669);
    this.miniTitleColor = Color(0x66054669);
    this.footerTextColor =  Color(0x991d465c);
  }



  ///
  ///  Getters
  ///
  
  String get bgImage {
    return 'assets/images/cards/'+_bgImageName;
  }

  
  
  
}
