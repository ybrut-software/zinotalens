import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Colors;

import '../utils/colors.dart';

Widget imageSliderView(List<String> sliderImages) => CarouselSlider(
      items: sliderImages
          .map(
            (i) => Builder(
              builder: ((context) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.gray,
                                blurRadius: 0.5,
                                offset: Offset(0.5, 0.5))
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(i),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )),
            ),
          )
          .toList(),
      options: CarouselOptions(
          padEnds: false,
          height: 180,
          autoPlay: true,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: false,
          scrollDirection: Axis.horizontal,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayInterval: Duration(seconds: 3)),
    );
