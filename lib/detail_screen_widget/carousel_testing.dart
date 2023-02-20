import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:propilla_app/detail_screen_widget/carousel_card.dart';
import 'package:propilla_app/models/house_model.dart';
import 'package:propilla_app/sample_data/data.dart';

class CarouselTesting extends StatefulWidget {
  final HouseModel house;

  const CarouselTesting({Key? key, required this.house,}) : super(key: key);



  @override
  State<CarouselTesting> createState() => _CarouselTestingState();
}

class _CarouselTestingState extends State<CarouselTesting> {

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          scrollDirection: Axis.horizontal,

        ),
        items: houseList.map((e) => HouseCarouselCard(house: e)).toList(),
      ),
    );
  }
}


