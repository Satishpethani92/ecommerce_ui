import 'package:ecommerce_ui/core/constant/image_constant.dart';
import 'package:flutter/material.dart';

class SliderModel {
  final String imagePath;
  final String name;

  SliderModel({required this.imagePath, required this.name});
}

List<SliderModel> sliderList = [
  SliderModel(imagePath: ImageConstant.sliderImage1, name: 'LUXURY FASHION &ACCESSORIES'),
  SliderModel(imagePath: ImageConstant.sliderImage2, name: 'LUXURY FASHION &ACCESSORIES'),
  SliderModel(imagePath: ImageConstant.sliderImage3, name: 'LUXURY FASHION &ACCESSORIES'),
];
List<Tab> tabs = const [
  Tab(
    child: Text('All',),
  ),
  Tab(
    child: Text('Apparel',),
  ),
  Tab(
    child: Text('Dress',),
  ),
  Tab(
    child: Text('Tshirt',),
  ),
  Tab(
    child: Text('Bag',),
  ),
];
