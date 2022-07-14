import 'package:ecommerce_ui/core/constant/color_constant.dart';
import 'package:ecommerce_ui/core/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget customAppBar({required GlobalKey<ScaffoldState> scaffoldKey}) {
  return AppBar(
    centerTitle: true,

    leading: Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: GestureDetector(
        onTap: (){
          scaffoldKey.currentState!.openDrawer();
        },
        child: SvgPicture.asset(ImageConstant.menuIcon),
      ),
    ),
    leadingWidth: 10.7.w,
    title: SvgPicture.asset(ImageConstant.logo, height: 4.5.h),
    actions: [
      SvgPicture.asset(ImageConstant.search, height: 6.7.w),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SvgPicture.asset(ImageConstant.shoppingBag, height: 6.7.w),
      )
    ],
    backgroundColor: ColorConstant.skyBlue,
    elevation: 0,
  );
}
