import 'package:electronic_shop/core/models/cart_model.dart';
import 'package:flutter/cupertino.dart';

class CartServices extends ChangeNotifier{
  List<CartModel> cartModel = [];
  List<CartModel> cartModelFinal = [];

  List<CartModel>? get cartInformation=> cartModelFinal;
  getCartInformation(String name, String price, int stock){

    cartModel.add(CartModel(name: name, price: price, stockCount: stock));
    cartModelFinal = Set.of(cartModel).toList();
    print(cartModelFinal);
    notifyListeners();
  }
}