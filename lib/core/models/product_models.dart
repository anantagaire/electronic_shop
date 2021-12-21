import 'package:intl/intl.dart';

class ProductModels{
Data? data;
ProductModels({this.data});
factory ProductModels.fromJson(Map<String, dynamic> parsedJson)
{
return ProductModels(
  data: Data.fromJson(parsedJson['data']),
);
}
}

class Data{
  List<Products>? product;
  Data({this.product});
  factory Data.fromJson(Map<String, dynamic> parsedJson)
  {
    return Data(
      product: (parsedJson['product'] as List).map((e) => Products.fromJson(e)).toList()
    );
  }
}

class Products{

  String? name;
  String? image;
  int? stockCount;
  String? date;
  String? price;
  List<String>? category;

  Products({this.name, this.image, this.stockCount, this.date, this.price, this.category});

  factory Products.fromJson(Map<String, dynamic> parsedJson)
  {
    String imageUrl = 'https://electronic-ecommerce.herokuapp.com/'+parsedJson['image'];
    String priceInUs = parsedJson['price'];
    String priceInInt = priceInUs.substring(1);
    String priceInRupee = 'Rs.' + priceInInt;
    String dateInFormat = DateFormat('dd-MM-yyyy hh:mm:a').format(new DateTime.fromMillisecondsSinceEpoch(parsedJson['createDate']));
    return Products(
      name: parsedJson['name'],
      image: imageUrl,
      stockCount: parsedJson['stock'],
      date: dateInFormat.substring(0,10),
      price: priceInRupee,
      category: (parsedJson['category']).cast<String>()
    );
  }

}

