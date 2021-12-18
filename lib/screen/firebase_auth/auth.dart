import 'package:dress_up/constant/animation_path.dart';
import 'package:dress_up/constant/colors.dart';
import 'package:dress_up/constant/icons_path.dart';
import 'package:dress_up/controller/user_controller.dart';
import 'package:dress_up/screen/home_screen/home_screen.dart';
import 'package:dress_up/widget/custom_icon.dart';
import 'package:dress_up/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  UserController userController = Get.put(UserController());
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 200,
                  width: 200,
                  child: Lottie.asset(AnimationPath.sale1)),
              const SizedBox(height: 20),
              customText("DRESS UP", 50, AppColors.text2Color, FontWeight.bold),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  await googleSignIn.signIn();
                  userController.adduser(
                      googleSignIn.currentUser!.photoUrl.toString(),
                      googleSignIn.currentUser!.displayName.toString(),
                      googleSignIn.currentUser!.email.toString());
                  Get.offAll(HomePage());
                },
                child: Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.buttonColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customIcon(IconPath.google, 50, 50),
                        customText("Sign In with Google", 20,
                            AppColors.text3Color, FontWeight.bold)
                      ],
                    )),
              )
            ],
          ),
        )),
      ),
    );
  }
}
