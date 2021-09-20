//home_page에서 사용하는법 모르겠음

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({ Key? key }) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List _isSelected = [true, false, false, false, false, false, false];
  final CarouselController _controller = CarouselController();

  int _current = 0;

  final List<String> images = [
    'assets/images/club_logo.jpeg',
    'assets/images/club_logo2.png',
    'assets/images/club_logo.jpeg',
    'assets/images/club_logo2.png',
    'assets/images/club_logo.jpeg',
  ];

  List<Widget> generateImageTiles(){
    return images
        .map(
          (element) => ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            element,
            fit: BoxFit.cover,
          ),
        ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
     var imageSliders = generateImageTiles();

    return Container(
    padding:  const EdgeInsets.only(top:50),
    color: Colors.black,
    child: CarouselSlider(
      items: imageSliders,
      options: CarouselOptions(
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        }
      ),
        carouselController: _controller,
    ),
  );
  }
}