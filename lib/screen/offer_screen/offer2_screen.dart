import 'package:dress_up/constant/animation_path.dart';
import 'package:dress_up/constant/colors.dart';
import 'package:dress_up/controller/cart_controller.dart';
import 'package:dress_up/method/persentage.dart';
import 'package:dress_up/model/products.dart';
import 'package:dress_up/widget/custom_image.dart';
import 'package:dress_up/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';

import '../cart_screen/cart_screen.dart';

class Offer2Screen extends StatefulWidget {
  double height, width;
  ProductsModel productsModel = ProductsModel();

  Offer2Screen(
      {Key? key,
      required this.height,
      required this.width,
      required this.productsModel})
      : super(key: key);

  @override
  _Offer2ScreenState createState() => _Offer2ScreenState();
}

class _Offer2ScreenState extends State<Offer2Screen> {
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: widget.height * 0.6,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: widget.width * 0.8,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          border: Border.all(
                            color: AppColors.buttonColor,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: customText(
                                          widget.productsModel.pant![index].name
                                              .toString(),
                                          30,
                                          AppColors.text1Color,
                                          FontWeight.bold))),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: customImage(
                                          widget
                                              .productsModel.pant![index].image
                                              .toString(),
                                          widget.height * 0.3,
                                          widget.width * 0.3)))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  customText("Old Price", 15,
                                      AppColors.text3Color, FontWeight.bold),
                                  customText(
                                      "RS ${widget.productsModel.pant![index].price.toString()}",
                                      15,
                                      AppColors.text2Color,
                                      FontWeight.bold),
                                ],
                              ),
                              Column(
                                children: [
                                  customText("New Price", 15,
                                      AppColors.text3Color, FontWeight.bold),
                                  customText(
                                      "RS ${persentagae(widget.productsModel.pant![index].price.toString(), 0.3)}",
                                      15,
                                      AppColors.text2Color,
                                      FontWeight.bold),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: InkWell(
                              onTap: () {
                                cartController.addItem(
                                    widget.productsModel.pant![index].name
                                        .toString(),
                                    widget.productsModel.pant![index].image
                                        .toString(),
                                    double.parse(persentagae(
                                        widget.productsModel.pant![index].price
                                            .toString(),
                                        0.3)),
                                    widget
                                        .productsModel.pant![index].description
                                        .toString(),
                                    2);
                                Get.off(CartScreen(
                                    height: widget.height,
                                    width: widget.width));
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
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                          child: customText(
                                              "2",
                                              10,
                                              AppColors.text1Color,
                                              FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: widget.height * 0.6,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: widget.width * 0.8,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          border: Border.all(
                            color: AppColors.buttonColor,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: customText(
                                          widget
                                              .productsModel.kurta![index].name
                                              .toString(),
                                          30,
                                          AppColors.text1Color,
                                          FontWeight.bold))),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: customImage(
                                          widget
                                              .productsModel.kurta![index].image
                                              .toString(),
                                          widget.height * 0.3,
                                          widget.width * 0.3)))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  customText("Old Price", 15,
                                      AppColors.text3Color, FontWeight.bold),
                                  customText(
                                      "RS ${widget.productsModel.kurta![index].price.toString()}",
                                      15,
                                      AppColors.text2Color,
                                      FontWeight.bold),
                                ],
                              ),
                              Column(
                                children: [
                                  customText("New Price", 15,
                                      AppColors.text3Color, FontWeight.bold),
                                  customText(
                                      "RS ${persentagae(widget.productsModel.kurta![index].price.toString(), 0.3)}",
                                      15,
                                      AppColors.text2Color,
                                      FontWeight.bold),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: InkWell(
                              onTap: () {
                                cartController.addItem(
                                    widget.productsModel.kurta![index].name
                                        .toString(),
                                    widget.productsModel.kurta![index].image
                                        .toString(),
                                    double.parse(persentagae(
                                        widget.productsModel.kurta![index].price
                                            .toString(),
                                        0.3)),
                                    widget
                                        .productsModel.kurta![index].description
                                        .toString(),
                                    2);
                                Get.off(CartScreen(
                                    height: widget.height,
                                    width: widget.width));
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
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                          child: customText(
                                              "2",
                                              10,
                                              AppColors.text1Color,
                                              FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: widget.height * 0.6,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: widget.width * 0.8,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          border: Border.all(
                            color: AppColors.buttonColor,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: customText(
                                          widget.productsModel.pant![index].name
                                              .toString(),
                                          30,
                                          AppColors.text1Color,
                                          FontWeight.bold))),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: customImage(
                                          widget
                                              .productsModel.pant![index].image
                                              .toString(),
                                          widget.height * 0.3,
                                          widget.width * 0.3)))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  customText("Old Price", 15,
                                      AppColors.text3Color, FontWeight.bold),
                                  customText(
                                      "RS ${widget.productsModel.pant![index].price.toString()}",
                                      15,
                                      AppColors.text2Color,
                                      FontWeight.bold),
                                ],
                              ),
                              Column(
                                children: [
                                  customText("New Price", 15,
                                      AppColors.text3Color, FontWeight.bold),
                                  customText(
                                      "RS ${persentagae(widget.productsModel.pant![index].price.toString(), 0.3)}",
                                      15,
                                      AppColors.text2Color,
                                      FontWeight.bold),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: InkWell(
                              onTap: () {
                                cartController.addItem(
                                    widget.productsModel.pant![index].name
                                        .toString(),
                                    widget.productsModel.pant![index].image
                                        .toString(),
                                    double.parse(persentagae(
                                        widget.productsModel.pant![index].price
                                            .toString(),
                                        0.3)),
                                    widget
                                        .productsModel.pant![index].description
                                        .toString(),
                                    2);
                                Get.off(CartScreen(
                                    height: widget.height,
                                    width: widget.width));
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
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                          child: customText(
                                              "2",
                                              10,
                                              AppColors.buttonColor,
                                              FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ]),
      )),
    );
  }
}
