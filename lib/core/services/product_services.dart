import 'dart:convert';

import 'package:electronic_shop/core/models/product_models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductServices extends ChangeNotifier{
  ProductModels? productModels;
  ProductModels? productModels1;
  List<Products>? products0;
  List<Products>? products1 = [];
  String url = 'https://electronic-ecommerce.herokuapp.com/api/v1/product';
  final  client = http.Client();


List<Products>? get products=> products1  ;

Future getProductList(int value1, int value2, List<String> value) async{
  print(value1);
  final response = await client.get(Uri.parse(url));
  final json = jsonDecode(response.body) ;
  productModels = ProductModels.fromJson(json);
  products0 = productModels!.data!.product!;

  if(value1==0 && value2 == 0 && value.length==0)
    {
      products1 = _sortPrice(products0!);
    }
  else if(value1==1 && value2 == 0 && value.length==0)
    {
      products1 = _sortPrice(products0!).reversed.toList();

    }
  else if(value1==0 && value2 == 1 && value.length==0)
    {
      products1 = _sortDate(products0!).reversed.toList();
    }
  else if(value1 == 0 && value2 == 0 && value.length>0)
    {
      final temp = _sortCategory(products0!, value);
      products1 = _sortPrice(temp);

    }
  else if(value1==1 && value2 == 0 && value.length>0)
  {
    final temp = _sortCategory(products0!, value);
    products1 = _sortPrice(temp);

  }
  else if(value1==0 && value2 == 1 && value.length>0)
  {
    final temp = _sortCategory(products0!, value);
    products1 = _sortDate(temp).reversed.toList();

  }
  else if((value1 == 1 && value2 == 1 && value.length>0))
    {
      final temp = _sortCategory(products0!, value);
      products1 = _sortDate(temp).reversed.toList();

    }
  else{
    products1 = products0;

  }


notifyListeners();




}
List<Products> _sortPrice(List<Products> products)
{

  products1!.clear();
  products.sort((a,b){
    return ((int.parse((a.price!).substring(3))).compareTo(int.parse(b.price!.substring(3))));

  });
  products1 = products;


  return products1!;

}

List<Products> _sortCategory(List<Products> products0, List<String> value)
{
  List<Products> temp =[];

  for(int i =0; i<value.length; i++)
  {
    for(int j =0; j<products0.length;j++)
    {
      if(products0[j].category!.contains(value[i])){
        temp.add(Products(name: products0[j].name, image: products0[j].image,
            category: products0[j].category,
            date: products0[j].date,
            price: products0[j].price,
            stockCount: products0[j].stockCount
        ));
      }

    }
  }
  return temp;
}

  List<Products> _sortDate(List<Products> products)
  {

    products1!.clear();
    products.sort((a,b){
      return (a.date!.compareTo(b.date!));

    });
    products1 = products;


    return products1!;

  }



}