import 'dart:async';

import 'package:dress_up/constant/colors.dart';
import 'package:dress_up/screen/auth/sign_in.dart';
import 'package:dress_up/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Timer(const Duration(seconds: 3), () {
        Get.to(() => const SignInScreen());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: AppColors.primaryColor,
                  height: size.height / 2,
                  width: size.width,
                  child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Lottie.asset('assets/animation/Sale1.json')),
                ),
                customText(
                  "DRESS Up",
                  30,
                  AppColors.text2Color,
                  FontWeight.normal,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
