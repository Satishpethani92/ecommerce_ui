import 'package:ecommerce_ui/core/constant/color_constant.dart';
import 'package:ecommerce_ui/core/constant/image_constant.dart';
import 'package:ecommerce_ui/core/constant/text_style_constant.dart';
import 'package:ecommerce_ui/core/model_class/slider_model.dart';
import 'package:ecommerce_ui/core/view_model/base_view.dart';
import 'package:ecommerce_ui/core/view_model/home_view_model/home_view_model.dart';
import 'package:ecommerce_ui/ui/widget/custom_appbar.dart';
import 'package:ecommerce_ui/ui/widget/custom_under_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:video_player/video_player.dart';

import 'widget/custom_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  HomeViewModel? model;
  late VideoPlayerController videoPlayerController;
  TabController? tabController;

  Future<bool> started() async {
    await videoPlayerController.initialize();
    await videoPlayerController.play();
    model?.isPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                customAppBar(),
                SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemCount: sliderList.length,
                        controller: model.pageController,
                        physics: const BouncingScrollPhysics(),
                        pageSnapping: true,
                        onPageChanged: (index) {
                          print(index);
                        },
                        itemBuilder: (context, _) {
                          return Stack(
                            children: [
                              Image.asset(
                                sliderList[_].imagePath,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 100.h,
                                width: 100.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 50.w),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'LUXURY',
                                          style: TextStyleConstant.italicBM,
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '\n        FASHION',
                                              style: TextStyleConstant.italicBM,
                                            ),
                                            TextSpan(
                                              text: '\n      &ACCESSORIES',
                                              style: TextStyleConstant.italicBM,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 100.w),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 75.h),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.h),
                                color: ColorConstant.blackTransparent,
                              ),
                              height: 5.5.h,
                              width: 70.w,
                              child: Center(
                                child: Text(
                                  'Explore Collection',
                                  style: TextStyleConstant.tenorSans,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.w),
                      height: 93.h,
                      width: 100.w,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'NEW ARRIVAL',
                            style: TextStyleConstant.tenorSans.merge(
                              TextStyle(
                                color: ColorConstant.black,
                                fontSize: 15.sp,
                                letterSpacing: 1.5.sp,
                              ),
                            ),
                          ),
                          underLine(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: TabBar(
                              labelPadding: EdgeInsets.zero,
                              automaticIndicatorColorAdjustment: false,
                              enableFeedback: true,
                              indicator: DotIndicator(
                                color: ColorConstant.brown,
                                distanceFromCenter: 16,
                                radius: 3,
                              ),
                              tabs: tabs,
                              isScrollable: false,
                              splashFactory: NoSplash.splashFactory,
                              controller: tabController,
                              unselectedLabelColor: ColorConstant.blackTransparent,
                              labelColor: ColorConstant.black,
                              indicatorColor: ColorConstant.brown,
                              labelStyle: TextStyleConstant.tenorSans.merge(
                                TextStyle(
                                  fontSize: 12.sp,
                                  letterSpacing: 0,
                                  color: ColorConstant.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          SizedBox(
                            height: 70.h,
                            child: TabBarView(
                              controller: tabController,
                              children: <Widget>[
                                tabView(),
                                tabView(),
                                tabView(),
                                tabView(),
                                tabView(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.w),
                                child: Text(
                                  'Explore More ',
                                  style: TextStyleConstant.tenorSans.merge(
                                    TextStyle(
                                      fontSize: 12.sp,
                                      letterSpacing: 0,
                                      color: ColorConstant.black,
                                    ),
                                  ),
                                ),
                              ),
                              SvgPicture.asset(ImageConstant.forwardArrow),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    underLine(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: 100.w,
                      height: 20.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageConstant.brandImg1,
                              ),
                              SvgPicture.asset(
                                ImageConstant.brandImg4,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageConstant.brandImg2,
                              ),
                              SvgPicture.asset(
                                ImageConstant.brandImg5,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageConstant.brandImg3,
                              ),
                              SvgPicture.asset(
                                ImageConstant.brandImg6,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    underLine(),
                    SizedBox(
                      height: 7.w,
                    ),
                    SizedBox(
                      height: 85.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Collections'.toUpperCase(),
                            style: TextStyleConstant.tenorSans.merge(
                              TextStyle(
                                letterSpacing: 2.sp,
                                fontSize: 15.sp,
                                color: ColorConstant.black,
                              ),
                            ),
                          ),
                          Image.asset(
                            ImageConstant.image1,
                          ),
                          Image.asset(
                            ImageConstant.image2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                  width: 100.w,
                  child: FutureBuilder<bool>(
                      future: started(),
                      builder: (context, AsyncSnapshot<bool> snapshot) {
                        if (snapshot.data ?? false) {
                          return AspectRatio(
                            aspectRatio: videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(videoPlayerController),
                          );
                        } else {
                          return const Text('waiting for video to load');
                        }
                      }),
                )
              ],
            ),
          ),
        );
      },
      onModelReady: (model) async {
        tabController = TabController(length: 5, vsync: this);
        videoPlayerController = VideoPlayerController.asset('assets/images/video/production ID_4065942.mp4');
        videoPlayerController.addListener(() {
          if (model.isPlaying && !videoPlayerController.value.isPlaying) {
          }
        });
        this.model = model;
      },
    );
  }
}
