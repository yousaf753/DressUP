import 'package:flutter/material.dart';

import '../constant/colors.dart';

RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
Widget customTextFormField ({required TextEditingController textEditingController, required String hintText,required bool obscureText,required bool email, onchange}) {
  return TextFormField(
    onEditingComplete: onchange,
    controller: textEditingController,
    keyboardType: TextInputType.text,
    maxLength: 50,
    maxLines: 1,
    showCursor: true,
    obscureText: obscureText,
    cursorColor: AppColors.text1Color,
    textAlign: TextAlign.center,
    style:  TextStyle(
      color: AppColors.text1Color,
      fontWeight: FontWeight.normal,
      fontSize: 15,
    ),
    validator: (value) {
      if ( value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      if (obscureText ){
        if(!regex.hasMatch(value)){
          return 'must be 8 character with mix case with digit';
        }
      }
      if(email && !value.contains("@gmail.com")){
        return 'Enter a valid email address';
      }
      return null;
    },
    decoration: InputDecoration(
        counter: const Offstage(),
        fillColor: AppColors.text2Color,
        filled: true,
        hintText: hintText,
        hintStyle:  TextStyle(
          color: AppColors.primaryColor,
        ),
        focusedBorder: _border(),
        disabledBorder: _border(),
        enabledBorder: _border(),
        errorBorder: _border(),
        focusedErrorBorder: _border(),
        border: _border(),
        contentPadding: EdgeInsets.zero),
  );
}

OutlineInputBorder _border() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      gapPadding: 10,
      borderSide: BorderSide.none);
}