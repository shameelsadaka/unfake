import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselCard.dart';


class HomeCarousel extends StatelessWidget {
  HomeCarousel({
    Key key,
  }) : super(key: key);

  int _current = 0;
  List imgList =  [
    'assets/images/cards/red.png',
    'assets/images/cards/blue.png',
    'assets/images/cards/cyan.png',
    'assets/images/cards/green.png',
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
      itemCount: 4,
      itemBuilder: (BuildContext context, int itemIndex) =>CarouselCard(bgcard:imgList[itemIndex]),

    );
    
  }
}
