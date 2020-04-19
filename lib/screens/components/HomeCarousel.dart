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
    return CarouselSlider(
    options:CarouselOptions(
        height: 420,
        viewportFraction: 0.85,
        initialPage: 0,
        enlargeCenterPage: true,
        reverse: false,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
    ),
    
    
    
    items: imgList.map((bgcard) {
      return CarouselCard(bgcard:bgcard);
    }).toList(),

    
    
        );
  }
}
