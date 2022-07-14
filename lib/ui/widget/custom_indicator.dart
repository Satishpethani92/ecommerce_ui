import 'package:ecommerce_ui/core/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

Widget indicator({required int itemCount, required int position,Color? indicatorColor}) {
  return SizedBox(
    height: 5.w,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 3.w),
          child: SvgPicture.asset(position == index ? ImageConstant.indicatorFilled : ImageConstant.indicatorUnfilled,color: indicatorColor),
        );
      },
    ),
  );
}
