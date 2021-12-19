import 'dart:convert';

import 'package:electronic_shop/core/models/product_models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductServices extends ChangeNotifier{
  ProductModels? productModels;
  String url = 'https://electronic-ecommerce.herokuapp.com/api/v1/product';
  final  client = http.Client();


ProductModels? get products=> productModels;

Future getProductList() async{
  final response = await client.get(Uri.parse(url));
  final json = jsonDecode(response.body) ;
  productModels = ProductModels.fromJson(json);
  notifyListeners();

}

}