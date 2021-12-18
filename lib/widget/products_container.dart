import 'package:dress_up/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'custom_text.dart';

Widget customProducts(
    double height, double width, String text, String imageUrl) {
  return Container(
    padding: const EdgeInsets.all(5),
    height: height * .2,
    width: width * .3,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.buttonColor),
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill)),
    child: Align(
      alignment: Alignment.bottomRight,
      child: customText(text, 20, AppColors.text2Color, FontWeight.normal),
    ),
  );
}
