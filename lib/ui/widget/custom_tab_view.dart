import 'package:ecommerce_ui/core/constant/color_constant.dart';
import 'package:ecommerce_ui/core/constant/text_style_constant.dart';
import 'package:ecommerce_ui/core/model_class/tab_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget tabView() {
  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    itemCount: tabBarGridModel.length,
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 60.w, mainAxisExtent: 75.w, crossAxisSpacing: 5.w, mainAxisSpacing: 3.w),
    itemBuilder: (context, _) {
      return Column(
        children: [
          Image.asset(tabBarGridModel[_].imageUrl, fit: BoxFit.fill, height: 25.h, width: double.infinity),
          SizedBox(
            height: 9.h,
            child: Column(
              children: [
                Text(
                  tabBarGridModel[_].titleName,
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.tenorSans.merge(
                    TextStyle(
                      height: 1.2.sp,
                      color: ColorConstant.black,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                Text(
                  tabBarGridModel[_].price,
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.tenorSans.merge(
                    TextStyle(
                      color: ColorConstant.brown,
                      height: 1.2.sp,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
