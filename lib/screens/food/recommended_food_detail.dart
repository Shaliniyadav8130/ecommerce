import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_icon.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  )
                ),
                child: Center(
                  child:BigText(size:Dimensions.font26,text:"Chinese Side"),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top:5,bottom:10),
              )
            ),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/food1.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: "Food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion. Plants, which convert solar energy to food by photosynthesis, are the primary food source. Animals that feed on plants often serve as sources of food for other animals. To learn more about the sequence of transfers of matter and energy in the form of food from organism to organism, see food chain.You are what you eat? Weird food factsYou are what you eat? Weird food factsOverview of weird facts about food.See all videos for this articleHunting and gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves. Food has long served as a carrier of culture in human societies and has been a driving force for globalization. This was especially the case during the early phases of European trade and colonial expansion, when foods such as the hot red pepper, corn (maize), and sweet potatoes spread throughout Europe to Africa and Asia.Food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion. Plants, which convert solar energy to food by photosynthesis, are the primary food source. Animals that feed on plants often serve as sources of food for other animals. To learn more about the sequence of transfers of matter and energy in the form of food from organism to organism, see food chain.Food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion. Plants, which convert solar energy to food by photosynthesis, are the primary food source. Animals that feed on plants often serve as sources of food for other animals. To learn more about the sequence of transfers of matter and energy in the form of food from organism to organism, see food chain."),
                   margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right:Dimensions.width20*2.5,
                top:Dimensions.height10,
                bottom:Dimensions.height10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(iconSize: Dimensions.iconSize24,iconColor: Colors.white,backgroundColor: AppColors.mainColor,icon: Icons.remove),
                BigText(text: "\$12.88 "+" X "+" 0 ",color: AppColors.mainBlackColor,size: Dimensions.font26,),
                AppIcon(iconSize: Dimensions.iconSize24,iconColor: Colors.white,backgroundColor: AppColors.mainColor,icon: Icons.add)
              ],
            )
          ),

          Container(
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
                    borderRadius:BorderRadius.circular(Dimensions.radius15),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.favorite,color: AppColors.mainColor,)
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
          )
        ],
      ),
    );
  }
}
