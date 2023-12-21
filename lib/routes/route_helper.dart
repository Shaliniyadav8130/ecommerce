import 'package:ecommerce/screens/home/main_food_page.dart';
import 'package:get/get.dart';


class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "popular-food";

  static List<GetPage> routes =[
    GetPage(name: "/", page: ()=>MainFoodPage())
  ];
}