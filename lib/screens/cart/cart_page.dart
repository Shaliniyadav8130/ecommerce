import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_icon.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                  SizedBox(width:Dimensions.width20*5),
                  AppIcon(icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                  AppIcon(icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              )
          ),

          Positioned(
            top: Dimensions.height20*5,
              left: Dimensions.width20,
              right:Dimensions.width20,
              bottom:0,
              child:Container(
                //color: Colors.redAccent,
                margin: EdgeInsets.only(top:Dimensions.height15),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: 10,
                      itemBuilder: (_,index){
                      return Container(
                        height: 100,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              height: Dimensions.height20*5,
                              width: Dimensions.width20*5,
                              margin: EdgeInsets.only(bottom: Dimensions.height10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/food1.jpg"),
                                ),
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white
                              ),
                            ),
                            SizedBox(width:Dimensions.width10),
                            Expanded(
                                child:Container(
                                  height: Dimensions.height20*5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: "Bitter Orange Juice",color: Colors.black54,),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        children: [
                                          BigText(text: "\$ 33.0",color: Colors.redAccent,)
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      );
                      }),
                ),
              ),
          )
        ],
      ),
    );
  }
}
