import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_ui/core/view_model/base_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseModel {
  PageController pageController = PageController(initialPage: 0);
  CarouselController carouselController = CarouselController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  bool isPlaying = false;
  int carouselIndex = 0;

}
