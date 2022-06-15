import 'package:dress_up/screen/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/authentication_helper.dart';
import '../../constant/colors.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_textform_field.dart';
import '../home_screen/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          automaticallyImplyLeading: false,
          title: customTextAuth(
              text: "Welcome",
              color: AppColors.text1Color,
              size: 20,
              fontWeight: FontWeight.bold),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.size.width * 0.8,
                    child:  customTextFormField(textEditingController: emailController,hintText: "Enter Your Email",obscureText: false,email: true,onchange: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }),
                  ),
                  SizedBox(
                    width: Get.size.width * 0.8,
                    child:  customTextFormField(textEditingController: passwordController,hintText: "Enter Your Password",obscureText: true,email: false,onchange: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }),
                  ),
                  InkWell(
                    overlayColor:MaterialStateProperty.all(AppColors.transparentColor) ,
                    onTap: () async {
                      {
                        if(await AuthenticationHelper().signIn(email: emailController.text.trim(),
                            password: passwordController.text.trim())) {
                          emailController.clear();
                          passwordController.clear();
                          Get.off(() =>const HomePage());
                        }
                      }
                      FocusManager.instance.primaryFocus?.unfocus();

                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.text2Color,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:  Center(
                        child:  customTextAuth(
                            text: "Sign In",
                            color: AppColors.text1Color,
                            size: 15,
                            fontWeight: FontWeight.bold),
                      ),

                    ),
                  ),
                  customTextAuth(
                      text: "or",
                      color: AppColors.buttonColor,
                      size: 15,
                      fontWeight: FontWeight.bold),
                  InkWell(
                    overlayColor:MaterialStateProperty.all(AppColors.transparentColor) ,
                    onTap: (){
                      Get.to(() =>const SignUpScreen());
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child:  customTextAuth(
                            text: "Sign Up",
                            color: AppColors.text1Color,
                            size: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}