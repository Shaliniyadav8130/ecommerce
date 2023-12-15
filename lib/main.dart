import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/screens/food/popular_food_detail.dart';
import 'package:ecommerce/screens/food/recommended_food_detail.dart';
import 'package:ecommerce/screens/home/food_page_body.dart';
import 'package:ecommerce/screens/home/main_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      title: 'ecommerce App ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainFoodPage()
    );
  }
}

