import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_ui/core/constant/color_constant.dart';
import 'package:ecommerce_ui/core/constant/image_constant.dart';
import 'package:ecommerce_ui/core/constant/text_style_constant.dart';
import 'package:ecommerce_ui/core/model_class/follow_us_model.dart';
import 'package:ecommerce_ui/core/model_class/hash_tag_list.dart';
import 'package:ecommerce_ui/core/model_class/just_for_you_section_model.dart';
import 'package:ecommerce_ui/core/model_class/menu_model.dart';
import 'package:ecommerce_ui/core/model_class/open_fashion_model.dart';
import 'package:ecommerce_ui/core/model_class/slider_model.dart';
import 'package:ecommerce_ui/core/view_model/base_view.dart';
import 'package:ecommerce_ui/core/view_model/home_view_model/home_view_model.dart';
import 'package:ecommerce_ui/ui/widget/custom_appbar.dart';
import 'package:ecommerce_ui/ui/widget/custom_footer.dart';
import 'package:ecommerce_ui/ui/widget/custom_indicator.dart';
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
  TabController? newArrivalTabController;
  TabController? drawerTabController;
  VideoPlayerController? videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          key: model.scaffoldKey,
          appBar: customAppBar(scaffoldKey: model.scaffoldKey),
          drawer: Drawer(
            width: 100.w,
            child: Column(
              children: [
                TabBar(
                  padding: EdgeInsets.all(10.w),
                  indicatorPadding: EdgeInsets.only(top: 9.w),
                  indicator: DotIndicator(color: ColorConstant.brown),
                  labelPadding: EdgeInsets.only(top: 5.w),
                  tabs: [
                    Text(
                      'Women',
                      style: TextStyleConstant.tenorSans.merge(
                        TextStyle(color: ColorConstant.black, fontSize: 13.sp, letterSpacing: 1.3.sp),
                      ),
                    ),
                    Text(
                      'Man',
                      style: TextStyleConstant.tenorSans.merge(
                        TextStyle(color: ColorConstant.black, fontSize: 13.sp, letterSpacing: 1.3.sp),
                      ),
                    ),
                    Text(
                      'KIDS',
                      style: TextStyleConstant.tenorSans.merge(
                        TextStyle(color: ColorConstant.black, fontSize: 13.sp, letterSpacing: 1.3.sp),
                      ),
                    ),
                  ],
                  controller: drawerTabController,
                ),
                SizedBox(
                  width: 100.w,
                  height: 70.h,
                  child: TabBarView(controller: drawerTabController, children: [
                    Scrollbar(
                      thickness: 1.w,
                      trackVisibility: true,
                      thumbVisibility: true,
                      controller: model.scrollController,
                      radius: Radius.circular(10.w),
                      child: ListView.builder(
                        controller: model.scrollController,
                        itemCount: menuIem.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            maintainState: true,
                            controlAffinity: ListTileControlAffinity.platform,
                            childrenPadding: EdgeInsets.only(left: 10.w),
                            title: Text(
                              menuIem[index],
                              style: TextStyleConstant.tenorSans.merge(
                                TextStyle(color: ColorConstant.black, fontSize: 13.sp, letterSpacing: 1.3.sp),
                              ),
                            ),
                            children: List<Widget>.generate(
                              menuSubIem.length,
                              (index) => ListTile(
                                title: Text(
                                  menuSubIem[index],
                                  style: TextStyleConstant.tenorSans.merge(
                                    TextStyle(color: ColorConstant.black, fontSize: 13.sp, letterSpacing: 1.3.sp),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Text('2'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('3'),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                exploreCollection(),
                newArrival(),
                brand(),
                collection(),
                /*SizedBox(
                  height: 25.h,
                  width: 100.w,
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      return AspectRatio(
                        aspectRatio: videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(videoPlayerController!),
                      );
                    },
                  ),
                ),*/
                SizedBox(
                  height: 20.w,
                ),
                Text(
                  'JUST FOR YOU',
                  style: TextStyleConstant.tenorSans.merge(
                    TextStyle(color: ColorConstant.black),
                  ),
                ),
                underLine(),
                SizedBox(
                  height: 7.w,
                ),
                CarouselSlider(
                  carouselController: model.carouselController,
                  options: CarouselOptions(
                      height: 50.h,
                      enableInfiniteScroll: false,
                      padEnds: false,
                      viewportFraction: 0.74,
                      pageSnapping: false,
                      disableCenter: false,
                      onPageChanged: (index, a) {
                        model.carouselIndex = index;
                        setState(() {});
                      }),
                  items: justForYouSctionList.map((index) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            Image.asset(index.image, fit: BoxFit.fill, width: 70.w),
                            SizedBox(
                              width: 65.w,
                              child: Text(
                                index.itemName,
                                textAlign: TextAlign.center,
                                style: TextStyleConstant.tenorSans.merge(
                                  TextStyle(
                                    height: 1.sp,
                                    color: ColorConstant.black,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              index.price,
                              textAlign: TextAlign.center,
                              style: TextStyleConstant.tenorSans.merge(
                                TextStyle(
                                  color: ColorConstant.brown,
                                  height: 1.3.sp,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 7.h,
                    top: 2.h,
                  ),
                  child: indicator(
                    position: model.carouselIndex,
                    itemCount: justForYouSctionList.length,
                  ),
                ),
                trending(),
                openFashion(),
                followUs(),
                footer(),
              ],
            ),
          ),
        );
      },
      onModelReady: (model) async {
        newArrivalTabController = TabController(length: 5, vsync: this);
        drawerTabController = TabController(length: 3, vsync: this);
        /*  videoPlayerController =
            VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
              ..initialize().then((_) {
                model.updateUI();
              });
        videoPlayerController!.play();
        videoPlayerController!.setLooping(true);*/
        this.model = model;
      },
    );
  }

  Widget exploreCollection() {
    return SizedBox(
      width: 100.w,
      height: 75.h,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: sliderList.length,
            physics: const BouncingScrollPhysics(),
            pageSnapping: true,
            onPageChanged: (index) {},
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
                  ),
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 15.w),
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
          ),
        ],
      ),
    );
  }

  Widget openFashion() {
    return Container(
      height: 65.h,
      color: ColorConstant.chipColor,
      child: Column(
        children: [
          SizedBox(width: 100.w),
          Padding(
            padding: EdgeInsets.only(top: 7.w, bottom: 7.w),
            child: SvgPicture.asset(
              ImageConstant.logo,
              height: 10.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              'Making a luxurious lifestyle accessible for a generous group of women is our daily drive.',
              textAlign: TextAlign.center,
              style: TextStyleConstant.tenorSans.merge(
                TextStyle(
                  color: ColorConstant.grey,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.w),
            child: underLine(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(openFashionList[index].icon, height: 10.w, color: ColorConstant.grey),
                    Text(
                      openFashionList[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyleConstant.tenorSans.merge(
                        TextStyle(
                          color: ColorConstant.grey,
                          fontSize: 11.1.sp,
                          height: 1.2.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                );
              },
              shrinkWrap: true,
              itemCount: followUsList.length,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 35.w,
                mainAxisExtent: 35.w,
                crossAxisSpacing: 10.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7.w),
            child: SvgPicture.asset(ImageConstant.spiral),
          ),
        ],
      ),
    );
  }

  Widget trending() {
    return Column(
      children: [
        Text(
          '@Trending'.toUpperCase(),
          style: TextStyleConstant.tenorSans.merge(
            TextStyle(color: ColorConstant.black, letterSpacing: 1.5),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5.w),
          child: Wrap(
            spacing: 6,
            children: List<Widget>.generate(hashTagList.length, (index) {
              return Chip(
                label: Text(hashTagList[index]),
                backgroundColor: ColorConstant.chipColor,
                labelStyle: TextStyleConstant.tenorSans.merge(
                  TextStyle(color: ColorConstant.grey, fontSize: 10.sp, fontWeight: FontWeight.w500),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget followUs() {
    return SizedBox(
      height: 55.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.w, bottom: 4.w),
            child: Text(
              'Follow Us',
              style: TextStyleConstant.tenorSans.merge(
                TextStyle(color: ColorConstant.black, letterSpacing: 3.sp, fontSize: 15.sp),
              ),
            ),
          ),
          SvgPicture.asset(
            ImageConstant.instagram,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 6.w),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(
                      followUsList[index].image,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorConstant.transparent,
                            ColorConstant.transparent,
                            ColorConstant.transparent,
                            ColorConstant.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(7.sp),
                        child: Text(
                          followUsList[index].name,
                          style: TextStyleConstant.tenorSans.merge(
                            TextStyle(color: ColorConstant.skyBlue, fontSize: 13.sp, letterSpacing: 1.2.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              shrinkWrap: true,
              itemCount: followUsList.length,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 45.w,
                mainAxisSpacing: 4.w,
                crossAxisSpacing: 4.w,
                mainAxisExtent: 40.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget newArrival() {
    return Column(
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
                  controller: newArrivalTabController,
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
                  controller: newArrivalTabController,
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
    );
  }

  Widget collection() {
    return SizedBox(
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
    );
  }

  Widget brand() {
    return Column(
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
      ],
    );
  }
}
