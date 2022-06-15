import 'package:dress_up/constant/animation_path.dart';
import 'package:dress_up/constant/colors.dart';
import 'package:dress_up/controller/order_controller.dart';
import 'package:dress_up/widget/custom_image.dart';
import 'package:dress_up/widget/custom_text.dart';
import 'package:dress_up/widget/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';

class OrderDetailScreen extends StatefulWidget {
  int index;
  double height, width;

  OrderDetailScreen(
      {Key? key,
      required this.height,
      required this.width,
      required this.index})
      : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Container(
                  height: widget.height * 0.3,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Lottie.asset(AnimationPath.location),
                ),
              Container(
                height: widget.height * 0.1,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customText(
                        "Total = RS ${orderController.orders[widget.index].amount.toStringAsFixed(0)}",
                        20,
                        AppColors.text2Color,
                        FontWeight.bold),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: orderController.orders[widget.index].itemCount,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          width: widget.width,
                          height: widget.height * 0.2,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              border: Border.all(color: AppColors.text3Color),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: customImage(
                                      orderController.orders[widget.index]
                                          .products[index].image
                                          .toString(),
                                      widget.height * 0.2,
                                      widget.width * 0.3)),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      customText(
                                          orderController.orders[widget.index]
                                              .products[index].name
                                              .toString(),
                                          20,
                                          AppColors.text3Color,
                                          FontWeight.bold),
                                      customText(
                                          "Quantity  ${orderController.orders[widget.index].products[index].quantity}",
                                          20,
                                          AppColors.buttonColor,
                                          FontWeight.bold),
                                      customText(
                                          "RS ${(orderController.orders[widget.index].products[index].price! * orderController.orders[widget.index].products[index].quantity).toStringAsFixed(0)}",
                                          20,
                                          AppColors.text2Color,
                                          FontWeight.bold),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
