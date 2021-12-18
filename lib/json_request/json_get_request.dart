import 'dart:convert';
import 'package:dress_up/model/products.dart';
import 'package:flutter/services.dart';

Future<ProductsModel> getProducts() async {
  final String response =
      await rootBundle.loadString("assets/json/products.json");
  var data = await json.decode(response);
  ProductsModel productsModel = ProductsModel.fromJson(data);
  return productsModel;
}
