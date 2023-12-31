import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double height;
  TextOverflow? overflow;

  SmallText({Key? key,
    this.color = const Color(0xffccc7c5),
    required this.text,
    this.size=12,
    this.overflow,
    this.height = 1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color:color,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
          fontSize: size,
          height: height,
        overflow: overflow,
      ),
    );
  }
}
