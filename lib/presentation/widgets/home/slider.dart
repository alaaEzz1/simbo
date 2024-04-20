import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

List<Widget> homeSliderItems = [
  Image.network(
    'https://i.pinimg.com/736x/3c/8f/97/3c8f9753ac55f8818f8fa64c83bd0a57.jpg',
    height: 400,
    fit: BoxFit.fill,
  ),
  Image.network(
    'https://i.pinimg.com/736x/96/7c/50/967c500448e518be6cc6962ea50e6e09.jpg',
    height: 400,
    fit: BoxFit.fill,
  ),
  Image.network(
    'https://i.pinimg.com/736x/f7/a7/76/f7a77600135ffccfa40e6b3b4851e302.jpg',
    height: 400,
    fit: BoxFit.fill,
  ),
];

Widget homeAutoSlider(){
  return Container(
    padding: const EdgeInsets.all(8),
    child: CarouselSlider(
      items: homeSliderItems,
      carouselController: CarouselController(),
      options: CarouselOptions(
        autoPlay: true,
        height: 300,
        animateToClosest: true,
        enlargeCenterPage: true,
        padEnds: true,
      ),
    ),
  );
}