import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/icontext_widget.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColumns extends StatelessWidget {
  final String text;
  const AppColumns({Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26,),
        SizedBox(height:Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15),
              ).expand((icon) => [icon]).toList(),
            ),

            SizedBox(width:10),

            SmallText(text: "4.5"),
            SizedBox(width:10),
            SmallText(text: "1287"),
            SizedBox(width:10),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(height:Dimensions.height20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(icon: Icons.circle_sharp,iconColor: AppColors.iconColor1,text: "Normal"),
            IconAndText(icon: Icons.location_on_outlined,iconColor: AppColors.mainColor,text: "1.7Km"),
            IconAndText(icon: Icons.access_time_rounded,iconColor: AppColors.iconColor2,text: "32 min"),

          ],
        ),
      ],
    );
  }
}
