
import 'package:ecommerce/screens/home/food_page_body.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
                margin: EdgeInsets.only(top:Dimensions.height45,bottom:Dimensions.height15),
                padding: EdgeInsets.only(left:Dimensions.width20,right:Dimensions.width20),
                  child:Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              BigText(text: "Uttar Pradesh",color: AppColors.mainColor,),
                              Row(
                                children: [
                                  SmallText(text: "Ghaziabad",color: Colors.black54,),
                                  Icon(Icons.arrow_drop_down)

                                ],
                              ),
                              ],
                          ),

                          Center(
                            child: Container(
                              width: Dimensions.height45,
                              height: Dimensions.height45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                                  color: AppColors.mainColor
                              ),
                              child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconSize24,),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
              ),

          Expanded(
              child:SingleChildScrollView(
                child: FoodPageBody(),
              ) ),

        ],
      ),
    );
  }
}
