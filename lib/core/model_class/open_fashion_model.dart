import 'package:ecommerce_ui/core/constant/image_constant.dart';

class OpenFashion{
 final String icon;
 final String title;

 OpenFashion({required this.icon, required this.title});
}


List<OpenFashion> openFashionList = [
 OpenFashion(icon: ImageConstant.stoneIcon, title: 'Fast shipping. Free on orders over \$25.'),
 OpenFashion(icon: ImageConstant.plantIcon, title: 'Sustainable process from start to finish.'),
 OpenFashion(icon: ImageConstant.brokenIcon, title: 'Unique designs and high-quality materials.'),
 OpenFashion(icon: ImageConstant.heartIcon, title: 'Fast shipping.   Free on orders over \$25.'),
];
