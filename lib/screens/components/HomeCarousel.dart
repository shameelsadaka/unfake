import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselCard.dart';
import '../templates/CardTemplate.dart';


class HomeCarousel extends StatelessWidget {
  HomeCarousel({
    Key key,
  }) : super(key: key);

  List cardList =  [
    new CardTemplate.blueCard(),
    new CardTemplate.redCard(),
    new CardTemplate.greenCard(),
    new CardTemplate.yellowCard(),
    new CardTemplate.cyanCard(),
  ];


  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options:CarouselOptions(
        height: 430,
        viewportFraction: 0.85,
        enlargeCenterPage: true,
        reverse: false,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: cardList.length,
      itemBuilder: (BuildContext context, int itemIndex) =>CarouselCard(cardTemplate:cardList[itemIndex]),

    );
    
  }
}
