import 'package:electronic_shop/core/models/product_models.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  Products? data;

  ProductDetails({Key? key, @required this.data}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
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
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(

                          child: Text(
                            '-',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          onTap: (){
                            setState(() {
                              if(this.value>0)
                                {
                                  setState(() {
                                    this.value--;
                                  });
                                }
                            });
                          },
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Text(
                          value.toString(),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        GestureDetector(
                          onTap: (){
                            if(this.value<widget.data!.stockCount!)
                              {
                                setState(() {
                                  this.value++;
                                });
                              }
                          },
                          child: Text(
                            '+',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.06,
                  ),
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Ink(
                      width: width * 0.6,
                      height: 40,
                      color: Colors.red,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Add to Cart',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
