import 'package:ecommerce_ui/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextStyleConstant {
  static TextStyle italicBM = TextStyle(
    fontFamily: 'Bodoni Moda',
    color: ColorConstant.grey.withOpacity(0.6),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.7.sp,
    height: 1.2,
    fontSize: 30.sp,
  );
  static TextStyle tenorSans = TextStyle(
      fontFamily: 'TenorSans', color: Colors.white, fontSize: 17.sp
  );
}
