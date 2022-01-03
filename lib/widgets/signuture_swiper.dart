import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class SignatureSwiper extends StatefulWidget {
  const SignatureSwiper({Key? key}) : super(key: key);

  @override
  _SignatureSwiperState createState() => _SignatureSwiperState();
}

class _SignatureSwiperState extends State<SignatureSwiper> {
  List images = [
    'imza1.jpeg',
    'imza2.jpeg',
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
