import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselCard.dart';
import 'package:itstrue/data/class/CardModel.dart';
import 'package:itstrue/data/logic/controller.dart';

class HomeCarousel extends StatefulWidget {
  HomeCarousel({
    Key key,
  }) : super(key: key);

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  List cardList =  [];
  @override
  void initState(){
    DataHandler().getAllData().then((List<CardModel> cards){
      cards.forEach((card){
        
        switch(card.cardStatus){
          case CardStatus.open:
          case CardStatus.important:
            cardList.add(card);
            break;
          default:
            break;
        }
        
      });
      setState(() {
        cardList=cardList;
      });
    });    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
      cardList.length > 0 ?
      CarouselSlider.builder(
        options:CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.6 ,
          viewportFraction: 0.85,
          enlargeCenterPage: true,
          reverse: false,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: cardList.length,
        itemBuilder: (BuildContext context, int itemIndex) =>CarouselCard(cardData:cardList[itemIndex]),

      )
      :
      new Container(
        margin: EdgeInsets.symmetric(vertical:20),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          strokeWidth: 2.0
        )
      );
    
  }
}
