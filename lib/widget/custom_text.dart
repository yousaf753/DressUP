import 'package:flutter/cupertino.dart';

Widget customText(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
    maxLines: 1,
    textAlign: TextAlign.left,
  );
}
Widget customTextAuth({required String text,required Color color,required double size,required FontWeight fontWeight}) {
  return Text(text,style: TextStyle(color: color,fontSize: size,fontWeight:fontWeight ),textAlign: TextAlign.center,);
}