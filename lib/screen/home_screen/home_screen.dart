import 'package:dress_up/constant/animation_path.dart';
import 'package:dress_up/constant/colors.dart';
import 'package:dress_up/controller/cart_controller.dart';
import 'package:dress_up/controller/order_controller.dart';
import 'package:dress_up/controller/user_controller.dart';
import 'package:dress_up/json_request/json_get_request.dart';
import 'package:dress_up/model/products.dart';
import 'package:dress_up/screen/auth/sign_account.dart';
import 'package:dress_up/screen/object_screen/object_screen.dart';
import 'package:dress_up/screen/order_screen/order_screen.dart';
import 'package:dress_up/screen/product_screen/cap_screen.dart';
import 'package:dress_up/screen/product_screen/coat_pant_screen.dart';
import 'package:dress_up/screen/product_screen/glasses_screen.dart';
import 'package:dress_up/screen/product_screen/jacket_screen.dart';
import 'package:dress_up/screen/product_screen/kurta_screen.dart';
import 'package:dress_up/screen/product_screen/pnat_screen.dart';
import 'package:dress_up/screen/product_screen/sherwani_screen.dart';
import 'package:dress_up/screen/product_screen/shirt_screen.dart';
import 'package:dress_up/screen/product_screen/shoes_screen.dart';
import 'package:dress_up/screen/product_screen/watch_screen.dart';
import 'package:dress_up/widget/carouselslider.dart';
import 'package:dress_up/widget/custom_text.dart';
import 'package:dress_up/widget/products_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../cart_screen/cart_screen.dart';
import '../offer_screen/offer1_screen.dart';
import '../offer_screen/offer2_screen.dart';
import '../offer_screen/offer3_screen.dart';
import '../offer_screen/offer4_screen.dart';
import 'about_us.dart';
import 'mu_account.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductsModel productsModel = ProductsModel();
  CartController cartController = Get.put(CartController());
  OrderController orderController = Get.put(OrderController());
  final UserController _userController = Get.put(UserController());

  @override
  void initState() {
    _userController.getPreferences();
    _userController.getShared();
    getProducts().then((value) {
      setState(() {
        productsModel = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 600) {
        height = width;
      } else if (constraints.maxHeight < 600) {
        height = 650;
        width = 370;
      }
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Lottie.asset(AnimationPath.drawer)),
          ),
          title:
              customText("Welcome", 20, AppColors.text1Color, FontWeight.bold),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {
                Get.to(CartScreen(
                  height: height,
                  width: width,
                ));
              },
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Lottie.asset(AnimationPath.cart)),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: AppColors.primaryColor,
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(300.0),
                            child: Image.network(_userController.image)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(_userController.name, 20,
                                AppColors.text2Color, FontWeight.normal),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                preferences.setBool("SignIn", false);
                                Get.snackbar("You are Sign Out",
                                    "For Shopping Sign In First");
                              },
                              child: Container(
                                height: 30,
                                width: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(2.0),
                                        bottomLeft: Radius.circular(2.0),
                                        bottomRight: Radius.circular(20.0))),
                                child: Center(
                                    child: customText(
                                        "Sign Out",
                                        20,
                                        AppColors.text1Color,
                                        FontWeight.normal)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                InkWell(
                  onTap: () {
                    Get.to(() => MyAccount());
                  },
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(2.0),
                            bottomLeft: Radius.circular(2.0),
                            bottomRight: Radius.circular(20.0))),
                    child: Center(
                        child: customText("My Account", 20,
                            AppColors.text1Color, FontWeight.normal)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _userController.getPreferences();
                      _userController.getShared();
                    });
                    if (_userController.signIn == true) {
                      if (orderController.itemCount >= 1) {
                        Get.to(OrderScreen(
                          height: height,
                          width: width,
                        ));
                      } else {
                        Get.snackbar(
                            "Confirm an Order First", "Than check order");
                      }
                    } else {
                      Get.snackbar("Sign In First", "Than continue shopping");
                      Get.to(() => const SignInAccount());
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(2.0),
                            bottomLeft: Radius.circular(2.0),
                            bottomRight: Radius.circular(20.0))),
                    child: Center(
                        child: customText("My Order's", 20,
                            AppColors.text1Color, FontWeight.normal)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const AboutUs());
                  },
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                        color: AppColors.text2Color,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(2.0),
                            bottomLeft: Radius.circular(2.0),
                            bottomRight: Radius.circular(20.0))),
                    child: Center(
                        child: customText("About Us", 20, AppColors.text1Color,
                            FontWeight.normal)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Column(
                    children: [
                      customText("For Any help Contact on", 10,
                          AppColors.text1Color, FontWeight.bold),
                      customText("03001234567", 30, AppColors.text2Color,
                          FontWeight.bold)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                carouselSlider(height),
                Divider(
                  color: AppColors.buttonColor,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                customText("Mega Offer's for New Year", 20,
                    AppColors.text1Color, FontWeight.bold),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Offer1Screen(
                      height: height,
                      width: width,
                      productsModel: productsModel,
                    ));
                  },
                  child: Container(
                    height: height * 0.3,
                    width: width,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        border: Border.all(color: AppColors.buttonColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: AppColors.offerColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: AppColors.text1Color,
                                      )),
                                  child: Center(
                                      child: customText(
                                          "40% OFF",
                                          30,
                                          AppColors.text1Color,
                                          FontWeight.bold))),
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: Lottie.asset(AnimationPath.sale2),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(Offer2Screen(
                      height: height,
                      width: width,
                      productsModel: productsModel,
                    ));
                  },
                  child: Container(
                    height: height * 0.3,
                    width: width,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        border: Border.all(color: AppColors.buttonColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: AppColors.offerColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: AppColors.text1Color,
                                      )),
                                  child: Center(
                                      child: customText(
                                          "30% OFF",
                                          30,
                                          AppColors.text1Color,
                                          FontWeight.bold))),
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: Lottie.asset(AnimationPath.sale1),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(Offer3Screen(
                      height: height,
                      width: width,
                      productsModel: productsModel,
                    ));
                  },
                  child: Container(
                    height: height * 0.3,
                    width: width,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        border: Border.all(color: AppColors.buttonColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: AppColors.offerColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: AppColors.text1Color,
                                      )),
                                  child: Center(
                                      child: customText(
                                          "50% OFF",
                                          30,
                                          AppColors.text1Color,
                                          FontWeight.bold))),
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: Lottie.asset(AnimationPath.shoes),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(Offer4Screen(
                      height: height,
                      width: width,
                      productsModel: productsModel,
                    ));
                  },
                  child: Container(
                    height: height * 0.3,
                    width: width,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        border: Border.all(color: AppColors.buttonColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: AppColors.offerColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: AppColors.text1Color,
                                      )),
                                  child: Center(
                                      child: customText(
                                          "50% OFF",
                                          30,
                                          AppColors.text1Color,
                                          FontWeight.bold))),
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: Lottie.asset(AnimationPath.glasses),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width,
                  decoration: BoxDecoration(color: AppColors.secondaryColor),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        customText("Products", 30, AppColors.text3Color,
                            FontWeight.bold),
                        const SizedBox(
                          height: 10,
                        ),
                        GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(CoatPantScreen(
                                  height: height,
                                  width: width,
                                  productsModel: productsModel,
                                ));
                              },
                              child: customProducts(height, width, "CoatPant",
                                  "assets/images/CoatPant/CoatPant1.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(WinterJacketScreen(
                                  height: height,
                                  width: width,
                                  productsModel: productsModel,
                                ));
                              },
                              child: customProducts(
                                  height,
                                  width,
                                  "Winter Jacket",
                                  "assets/images/WinterJacket/WinterJacket1.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(PantScreen(
                                  height: height,
                                  width: width,
                                  productsModel: productsModel,
                                ));
                              },
                              child: customProducts(height, width, "Pant",
                                  "assets/images/Pant/Pant1.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(ShirtScreen(
                                  height: height,
                                  width: width,
                                  productsModel: productsModel,
                                ));
                              },
                              child: customProducts(height, width, "Shirt",
                                  "assets/images/Shirt/Shirt1.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(SherwaniScreen(
                                  height: height,
                                  width: width,
                                  productsModel: productsModel,
                                ));
                              },
                              child: customProducts(height, width, "Sherwani",
                                  "assets/images/Sherwani/Sherwani1.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(KurtaScreen(
                                  height: height,
                                  width: width,
                                  productsModel: productsModel,
                                ));
                              },
                              child: customProducts(height, width, "Kurta",
                                  "assets/images/Kurta/Kurta3.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(ShoesScreen(
                                  height: height,
                                  width: width,
                                  productsModel: productsModel,
                                ));
                              },
                              child: customProducts(height, width, "Shoes",
                                  "assets/images/Shoes/Shoes1.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(WatchScreen(
                                  height: height,
                                  width: width,
                                  productsModel: productsModel,
                                ));
                              },
                              child: customProducts(height, width, "Watch",
                                  "assets/images/Watch/Watch1.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(GlassesScreen(
                                  height: height,
                                  width: width,
                                  productsModel: productsModel,
                                ));
                              },
                              child: customProducts(height, width, "Glasses",
                                  "assets/images/Glasses/Glasses1.png"),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(CapScreen(
                                  height: height,
                                  width: width,
                                  productsModel: productsModel,
                                ));
                              },
                              child: customProducts(height, width, "Cap",
                                  "assets/images/Cap/Cap1.png"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.buttonColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customText("3D Object's ", 20, AppColors.text3Color,
                          FontWeight.bold),
                      InkWell(
                          onTap: () {
                            Get.to(ObjectsScreen(
                              height: height,
                              width: width,
                            ));
                          },
                          child: Lottie.asset(AnimationPath.next))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
