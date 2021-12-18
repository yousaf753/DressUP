import 'package:carousel_slider/carousel_slider.dart';
import 'package:dress_up/constant/animation_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

Widget carouselSlider(double height) {
  return CarouselSlider(
    items: [
      Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Lottie.asset(AnimationPath.shopping1),
      ),
      Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Lottie.asset(AnimationPath.shopping2),
      ),
    ],

    //Slider Container properties
    options: CarouselOptions(
      height: height * 0.2,
      enlargeCenterPage: true,
      autoPlay: true,
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      viewportFraction: 0.8,
    ),
  );
}
