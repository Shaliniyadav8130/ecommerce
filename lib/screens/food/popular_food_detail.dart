import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/screens/cart/cart_page.dart';
import 'package:ecommerce/screens/home/main_food_page.dart';
import 'package:ecommerce/utils/app_constants.dart';
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
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());

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
                    image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!),
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

                  GetBuilder<PopularProductController>(builder: (controller){
                    return GestureDetector(
                         onTap: (){
                           if(controller.totalItems>=1){
                             Get.toNamed(RouteHelper.getCartPage());
                           }

                         },
                        child:Stack(
                          children: [
                            AppIcon(icon: Icons.shopping_cart_outlined),
                            Get.find<PopularProductController>().totalItems>=1?
                            Positioned(
                                right:0,
                                top:0,
                                child: AppIcon(icon: Icons.circle,size: 20,iconColor: Colors.transparent,backgroundColor: AppColors.mainColor,)):
                            Container(),
                            Get.find<PopularProductController>().totalItems>=1?
                            Positioned(
                                right:5,
                                top:3,
                                child: BigText(text:Get.find<PopularProductController>().totalItems.toString(),
                                  size:12,color: Colors.white,
                                )):
                            Container()
                          ],
                        )
                    );
                  })
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
                    AppColumns(text:product.name!),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduce"),
                    SizedBox(height:Dimensions.height20),
                    Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(text: product.description!),
                        ),
                    ),

                    ],
                ),
              ),
          ),

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
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
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(false);
                      },
                      child:Icon(Icons.remove,color: AppColors.signColor,),
                    ),

                    SizedBox(width:Dimensions.width10/2),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(width:Dimensions.width10/2),
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                      },
                      child:Icon(Icons.add,color: AppColors.signColor,),
                    ),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:Dimensions.height10,bottom:Dimensions.height10,left:Dimensions.width20,right:Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
                child: GestureDetector(
                  onTap: (){
                    popularProduct.addItem(product);
                  },
                    child: BigText(text:"\$ ${product.price!} | Add to Cart",color: Colors.white,)),
              )
            ],
          ),
        );
      },)
    );
  }
}
