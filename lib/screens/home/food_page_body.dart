import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_product_controller.dart';
import 'package:ecommerce/models/popular_product_model.dart';
import 'package:ecommerce/screens/food/popular_food_detail.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_columns.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/icontext_widget.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewController;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });

    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        // Slider Section
      GetBuilder<PopularProductController>(builder: (popularProducts){
        return popularProducts.isLoaded?Container(
          height:Dimensions.pageView,
          //color: Colors.red,
          child: GestureDetector(
            onTap: (){
              Get.to(()=>PopularFoodDetail());
            },
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context,position){
                  return _buildPageItem(position, popularProducts.popularProductList[position]);
                }
            ),
          ),
        ):CircularProgressIndicator(
          color: AppColors.mainColor,
        );
      }),

    // Dots Section
    GetBuilder<PopularProductController>(builder: (popularProducts){
      return new DotsIndicator(
        dotsCount: popularProducts.popularProductList.length<=0?1:popularProducts.popularProductList.length,
        position: _currPageValue.toInt(),
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      );
    }),

    // Popular Section
    SizedBox(height:Dimensions.height20),
        Container(
          margin: EdgeInsets.only(left:Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width:Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom:5),
                child: BigText(text:".",color:Colors.black54),
              ),
              SizedBox(width:Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom:7),
                child: SmallText(text:"Food pairing",color:Colors.black54),
              )
              ],
          ),
        ),

        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?Container(
            //height: 800,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top:10),
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.width20,),
                      child: Row(
                        children: [
                          //Image section
                          Container(
                            height:Dimensions.listViewImgSize,
                            width:Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white38,
                              image: DecorationImage(
                                image: NetworkImage(
                                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          //Content section
                          Expanded(
                            child: Container(
                              height:Dimensions.listViewTextContSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimensions.radius20),
                                    bottomRight: Radius.circular(Dimensions.radius20),
                                  ),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left:Dimensions.width10,right:Dimensions.width10),
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                    SizedBox(height:Dimensions.height10),
                                    SmallText(overflow: TextOverflow.ellipsis,text: recommendedProduct.recommendedProductList[index].description!),
                                    SizedBox(height:Dimensions.height10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndText(icon: Icons.circle_sharp,iconColor: AppColors.iconColor1,text: "Normal"),

                                        IconAndText(icon: Icons.location_on_outlined,iconColor: AppColors.mainColor,text: "1.7Km"),

                                        IconAndText(icon: Icons.access_time_rounded,iconColor: AppColors.iconColor2,text: "32 min"),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        })
      ],
    );
  }
  Widget _buildPageItem(int index, ProductModel popularProduct){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }


    return Transform(
      transform:matrix,
      child: Stack(
        children: [
          Container(
            height:Dimensions.pageViewController,
            margin: EdgeInsets.only(left:Dimensions.width10,right:Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Color(0xff69d5ff),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.BASE_URL+"/uploads/"+popularProduct.img!),
                )
            ),
          ),
           Align(
             alignment: Alignment.bottomCenter,
             child: Container(
               height:Dimensions.pageViewTextController,
               margin: EdgeInsets.only(left:Dimensions.width30,right:Dimensions.width30,bottom: Dimensions.height30),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(Dimensions.radius20),
                   color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                     color:Color(0xffe8e8e8),
                     blurRadius:5.0,
                     offset:Offset(0,5),
                   ),
                   BoxShadow(
                     color: Colors.white,
                     offset: Offset(-5,0),
                   ),
                   BoxShadow(
                     color: Colors.white,
                     offset: Offset(5,0),
                   ),
                 ]
               ),
               child: Container(
                 padding: EdgeInsets.only(left:Dimensions.width15,right:Dimensions.width15,top:Dimensions.height10),
                 child: AppColumns(text:popularProduct.name!),
               ),
             ),
           ),

        ],
      ),
    );
  }
}
