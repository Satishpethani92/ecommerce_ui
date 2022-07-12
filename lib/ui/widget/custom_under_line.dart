import 'package:ecommerce_ui/core/constant/color_constant.dart';
import 'package:ecommerce_ui/core/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget underLine(){
  return  SvgPicture.asset(
    ImageConstant.underLine,
    color: ColorConstant.black,
  );
}