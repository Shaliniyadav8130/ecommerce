import 'package:ecommerce/screens/home/main_food_page.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_columns.dart';
import 'package:ecommerce/widgets/app_icon.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/expandable_text_widget.dart';
import 'package:ecommerce/widgets/icontext_widget.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Positioned(
            top:0,
            left: 0,
              right: 0,
              child:Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image: AssetImage("assets/images/food1.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
          ),
          Positioned(
            top:Dimensions.height45,
            left:Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>MainFoodPage());
                    },
                    child:AppIcon(icon: Icons.arrow_back_ios_new_rounded),
                  ),

                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )
          ),
          Positioned(
            top:Dimensions.popularFoodImgSize-20,
              left: 0,
              right:0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left:Dimensions.width20,right:Dimensions.width20,top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumns(text:"Chinese side"),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduce"),
                    SizedBox(height:Dimensions.height20),
                    Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(text: "Food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion. Plants, which convert solar energy to food by photosynthesis, are the primary food source. Animals that feed on plants often serve as sources of food for other animals. To learn more about the sequence of transfers of matter and energy in the form of food from organism to organism, see food chain.",),
                        ),
                    ),

                    ],
                ),
              ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeight,
        padding: EdgeInsets.only(top:Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right:Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top:Dimensions.height10,bottom:Dimensions.height10,left:Dimensions.width20,right:Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color: AppColors.signColor,),
                  SizedBox(width:Dimensions.width10/2),
                  BigText(text: "0"),
                  SizedBox(width:Dimensions.width10/2),
                  Icon(Icons.add,color: AppColors.signColor,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:Dimensions.height10,bottom:Dimensions.height10,left:Dimensions.width20,right:Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(text:"\$10 | Add to Cart",color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
