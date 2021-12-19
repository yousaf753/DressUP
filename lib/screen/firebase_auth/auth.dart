import 'package:dress_up/constant/animation_path.dart';
import 'package:dress_up/constant/colors.dart';
import 'package:dress_up/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'google_sign_in_button.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);
  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}
class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Lottie.asset(AnimationPath.sale1),
              ),
              Expanded(
                  child: Column(
                children: [
                  customText(
                      "DRESS UP", 30, AppColors.text2Color, FontWeight.bold),
                  SizedBox(
                    height: 20,
                  ),
                  const GoogleSignInButton()
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
