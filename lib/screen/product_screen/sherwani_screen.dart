import 'package:dress_up/constant/colors.dart';
import 'package:dress_up/model/products.dart';
import 'package:dress_up/screen/product_detail_screen/sherwani_detail_screen.dart';
import 'package:dress_up/widget/custom_image.dart';
import 'package:dress_up/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SherwaniScreen extends StatefulWidget {
  final double height, width;
  ProductsModel productsModel = ProductsModel();

  SherwaniScreen(
      {Key? key,
      required this.height,
      required this.width,
      required this.productsModel})
      : super(key: key);

  @override
  _SherwaniScreenState createState() => _SherwaniScreenState();
}

class _SherwaniScreenState extends State<SherwaniScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
            child: widget.productsModel.sherwani![0].image != null
                ? ListView.builder(
                    itemCount: widget.productsModel.sherwani!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: widget.height * 0.7,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              border: Border.all(
                                color: AppColors.buttonColor,
                              ),
                              borderRadius: BorderRadius.circular(50)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              customText(
                                  widget.productsModel.sherwani![index].name
                                      .toString(),
                                  30,
                                  AppColors.text3Color,
                                  FontWeight.bold),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  customImage(
                                      widget
                                          .productsModel.sherwani![index].image
                                          .toString(),
                                      widget.height * 0.5,
                                      widget.width * 0.7),
                                  customText(
                                      "RS ${widget.productsModel.sherwani![index].price.toString()}",
                                      15,
                                      AppColors.text2Color,
                                      FontWeight.bold),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(SherwaniDetailScreen(
                                      height: widget.height,
                                      width: widget.width,
                                      productsModel: widget.productsModel,
                                      index: index,
                                    ));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 50, bottom: 50),
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: AppColors.buttonColor,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(2.0),
                                            bottomLeft: Radius.circular(2.0),
                                            bottomRight:
                                                Radius.circular(20.0))),
                                    child: Center(
                                        child: customText(
                                            "Detail",
                                            20,
                                            AppColors.text1Color,
                                            FontWeight.normal)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : SpinKitHourGlass(color: AppColors.text2Color)),
      ),
    );
  }
}
