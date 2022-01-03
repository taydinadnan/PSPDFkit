import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class ImageSwiper extends StatefulWidget {
  const ImageSwiper({Key? key}) : super(key: key);

  @override
  _ImageSwiperState createState() => _ImageSwiperState();
}

class _ImageSwiperState extends State<ImageSwiper> {
  List images = [
    'edit1.jpeg',
    'image1.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/" + images[index],
                ),
                fit: BoxFit.cover),
          ),
        );
      },
      pagination: const SwiperPagination(),
      itemCount: images.length,
      control: const SwiperControl(color: Colors.orange),
      autoplay: true,
      autoplayDelay: 3000,
    );
  }
}
