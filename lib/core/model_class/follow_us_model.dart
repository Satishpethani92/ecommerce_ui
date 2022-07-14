import 'package:ecommerce_ui/core/constant/image_constant.dart';

class FollowUs{
  final String image;
  final String name;
  FollowUs({required this.image, required this.name});
}

List<FollowUs> followUsList = [
  FollowUs(image: ImageConstant.instagramImage1, name: '@mia'),
  FollowUs(image: ImageConstant.instagramImage2, name: '@_jihyn'),
  FollowUs(image: ImageConstant.instagramImage3, name: '@mia'),
  FollowUs(image: ImageConstant.instagramImage4, name: '@_jihyn'),
];