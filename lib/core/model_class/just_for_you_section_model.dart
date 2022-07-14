import 'package:ecommerce_ui/core/constant/image_constant.dart';

class JustForYouSctionModel{
  final String image;
  final String itemName;
  final String price;

  JustForYouSctionModel({required this.image, required this.itemName, required this.price});
}

List<JustForYouSctionModel> justForYouSctionList = [
  JustForYouSctionModel(image:ImageConstant.tabImage2 , itemName: 'Harris Tweed Three button Jacket', price: '\$120'),
  JustForYouSctionModel(image:ImageConstant.image3 , itemName: 'Cashmere Blend Cropped Jacket SW1WJ285-AM', price: '\$120'),
  JustForYouSctionModel(image:ImageConstant.tabImage1 , itemName: 'Harris Tweed Three button Jacket', price: '\$120')
];