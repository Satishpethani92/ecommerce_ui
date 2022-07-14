import 'package:ecommerce_ui/core/constant/image_constant.dart';

class TabBarGridModel {
  final String imageUrl;
  final String titleName;
  final String price;

  TabBarGridModel({required this.imageUrl, required this.titleName, required this.price});
}


List<TabBarGridModel> tabBarGridModel = [
  TabBarGridModel(imageUrl: ImageConstant.tabImage1, titleName: '21WN reversible angora cardigan', price: '\$120'),
  TabBarGridModel(imageUrl: ImageConstant.tabImage2, titleName: '21WN reversible angora cardigan', price: '\$120'),
  TabBarGridModel(imageUrl: ImageConstant.tabImage3, titleName: '21WN reversible angora cardigan', price: '\$120'),
  TabBarGridModel(imageUrl: ImageConstant.tabImage4, titleName: 'Oblong bag', price: '\$120'),
];

