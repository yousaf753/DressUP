import 'package:dress_up/constant/animation_path.dart';
import 'package:dress_up/constant/colors.dart';
import 'package:dress_up/constant/icons_path.dart';
import 'package:dress_up/controller/cart_controller.dart';
import 'package:dress_up/model/products.dart';
import 'package:dress_up/widget/custom_icon.dart';
import 'package:dress_up/widget/custom_image.dart';
import 'package:dress_up/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';

import '../cart_screen/cart_screen.dart';

class KurtaDetailScreen extends StatefulWidget {
  final double height, width;
  int index;
  ProductsModel productsModel = ProductsModel();

  KurtaDetailScreen(
      {Key? key,
      required this.height,
      required this.width,
      required this.index,
      required this.productsModel})
      : super(key: key);

  @override
  _KurtaDetailScreenState createState() => _KurtaDetailScreenState();
}

class _KurtaDetailScreenState extends State<KurtaDetailScreen> {
  CartController cartController = Get.find();
  late int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Container(
          height: widget.height,
          width: widget.width,
          color: AppColors.secondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText(
                  widget.productsModel.kurta![widget.index].name.toString(),
                  50,
                  AppColors.text1Color,
                  FontWeight.bold),
              customImage(
                  widget.productsModel.kurta![widget.index].image.toString(),
                  widget.height * 0.5,
                  widget.width),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      customText("Description", 20, AppColors.text1Color,
                          FontWeight.bold),
                      Text(
                        widget.productsModel.kurta![widget.index].description
                            .toString(),
                        style: TextStyle(
                            color: AppColors.text3Color,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customText(
                      "RS ${widget.productsModel.kurta![widget.index].price.toString()}",
                      30,
                      AppColors.text2Color,
                      FontWeight.bold),
                  InkWell(
                    onTap: () {
                      if (quantity >= 1) {
                        cartController.addItem(
                            widget.productsModel.kurta![widget.index].name
                                .toString(),
                            widget.productsModel.kurta![widget.index].image
                                .toString(),
                            double.parse(widget
                                .productsModel.kurta![widget.index].price
                                .toString()),
                            widget
                                .productsModel.kurta![widget.index].description
                                .toString(),
                            quantity);
                        Get.off(CartScreen(
                            height: widget.height, width: widget.width));
                      }
                    },
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Stack(
                        children: [
                          Lottie.asset(AnimationPath.cartItem),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                                child: customText(quantity.toString(), 10,
                                    AppColors.text1Color, FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: customIcon(IconPath.add, 50, 50),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (quantity <= 0) {
                          quantity = 0;
                        } else {
                          quantity--;
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: customIcon(IconPath.sub, 50, 50),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}