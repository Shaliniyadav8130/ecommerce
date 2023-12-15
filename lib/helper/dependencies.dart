import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/data/repository/popular_product_repo.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async{
  //apiCLient
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //Repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}