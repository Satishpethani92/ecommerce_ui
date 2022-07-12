import 'package:ecommerce_ui/core/view_model/base_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseModel {
  PageController pageController = PageController(initialPage: 0);
  bool isPlaying = false;
  int pageIndex = 0;

}
