import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/data/repository/cart_repo.dart';
import 'package:ecommerce/data/repository/popular_product_repo.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async{
  //apiCLient
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //Repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>CartRepo());

  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}