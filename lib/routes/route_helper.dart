import 'package:ecommerce/screens/food/popular_food_detail.dart';
import 'package:ecommerce/screens/home/main_food_page.dart';
import 'package:get/get.dart';

import '../screens/food/recommended_food_detail.dart';


class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId)=>'$popularFood?pageId = $pageId';
  static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId = $pageId';

  static List<GetPage> routes =[
    GetPage(name: initial, page: ()=>MainFoodPage()),

    GetPage(name: popularFood, page: (){
      var pageId = Get.arguments['pageId'];
      print("Retrieved pageId: $pageId");
      return PopularFoodDetail(pageId: int.parse(pageId ?? '0'));
    },
    transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: (){
      var pageId = Get.arguments['pageId'];
      print("Retrieved pageId: $pageId");
      return RecommendedFoodDetail(pageId: int.parse(pageId ?? '0'));
    },
        transition: Transition.fadeIn
    ),
  ];
}