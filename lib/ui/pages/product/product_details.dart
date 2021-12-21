import 'package:electronic_shop/core/models/product_models.dart';
import 'package:electronic_shop/core/services/cart_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  Products? data;

  ProductDetails({Key? key, @required this.data}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _key,
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(widget.data!.image!),
                  )),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data!.name!,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Price: ${widget.data!.price!}",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Category:${widget.data!.category![0]},${widget.data!.category![1]}', style: Theme.of(context).textTheme.headline4,),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Created At: ${widget.data!.date!.toString()}",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Current Stock: ${widget.data!.stockCount!.toString()}",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left:10, right:10, top: 20),
              child: InkWell(
                onTap: () {
                  _key.currentState!.showSnackBar(SnackBar(
                    content: Text('Added'),
                  ));
                  Provider.of<CartServices>(context, listen: false).getCartInformation(widget.data!.name!, widget.data!.price!, widget.data!.stockCount!);


                },
                child: Ink(
                  height: 40,
                  width: width,
                  color: Colors.red,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Add to Cart',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
