import 'package:ecommerce_ui/core/constant/color_constant.dart';
import 'package:ecommerce_ui/core/constant/image_constant.dart';
import 'package:ecommerce_ui/core/constant/text_style_constant.dart';
import 'package:ecommerce_ui/ui/widget/custom_under_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

Widget footer(){
  return SizedBox(
    width: 70.w,
    child: Column(
      children: [
        platformIcon(),
        underLine(),
        Padding(
          padding: EdgeInsets.only(top: 8.w, bottom: 9.w),
          child: Text(
            'support@openui.design +60 825 876\t\t\t\t\t\t\t\t\t\t\t08:00 - 22:00 - Everyday ',
            textAlign: TextAlign.center,
            style: TextStyleConstant.tenorSans.merge(
              TextStyle(
                  color: ColorConstant.black,
                  height: 1.5.sp,
                  fontSize: 15.sp,
                  letterSpacing: 0.8.sp
              ),
            ),
          ),
        ),
        underLine(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About',
                style: TextStyleConstant.tenorSans.merge(
                  TextStyle(
                    color: ColorConstant.black,
                    height: 1.5.sp,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              Text(
                'Contact',
                style: TextStyleConstant.tenorSans.merge(
                  TextStyle(
                    color: ColorConstant.black,
                    height: 1.5.sp,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              Text(
                'Blog',
                style: TextStyleConstant.tenorSans.merge(
                  TextStyle(
                    color: ColorConstant.black,
                    height: 1.5.sp,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


Widget platformIcon(){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(ImageConstant.twitter, height: 6.w),
      Padding(
        padding: EdgeInsets.only(top: 10.w, bottom: 10.w, right: 14.w, left: 14.w),
        child: SvgPicture.asset(ImageConstant.instagramFilled, height: 6.w),
      ),
      SvgPicture.asset(ImageConstant.youTube, height: 6.w),
    ],
  );
}