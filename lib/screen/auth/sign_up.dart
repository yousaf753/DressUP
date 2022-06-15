import 'package:dress_up/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/authentication_helper.dart';
import '../../constant/colors.dart';
import '../../widget/custom_loader.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_textform_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
            text: "Sign Up",
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.size.width * 0.8,
                  child:  customTextFormField(textEditingController: nameController,hintText: "Enter Your Name",obscureText: false,email: false,onchange: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }),
                ),
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
                Center(
                  child: InkWell(
                    overlayColor:MaterialStateProperty.all(AppColors.transparentColor) ,
                    onTap: () async {
                      if(_formKey.currentState!.validate())
                      {
                        await  AuthenticationHelper().signUp(email: emailController.text.trim(), password: passwordController.text.trim());
                        Get.defaultDialog(
                          title: "Wait",
                          backgroundColor: AppColors.buttonColor.withOpacity(0.5),
                          titleStyle:  TextStyle(color: AppColors.secondaryColor),
                          barrierDismissible: true,
                          radius: 15,
                          content: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                customLoader(),
                                const SizedBox(height: 30,),
                                customTextAuth(text: "Creating Your Account",size: 20,color: AppColors.primaryColor,fontWeight: FontWeight.bold),
                              ],
                            ),
                          ),
                        );
                        if(AuthenticationHelper().user != null) {
                          Get.offAll(() => const HomePage());
                          emailController.clear();
                          passwordController.clear();
                          nameController.clear();
                        }
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
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
                        child: customTextAuth(text: "Sign Up",size: 15,color: AppColors.text1Color,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}