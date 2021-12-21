import 'package:electronic_shop/core/services/cart_services.dart';
import 'package:electronic_shop/ui/pages/cart/checkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int value = 0;
  int price=0;
  int totalPrice=0;

  @override
  void initState() {
    var provider = Provider.of<CartServices>(context, listen: false);
    if(provider.cartInformation!.isNotEmpty)
      {
        for (int i =0 ; i<provider.cartInformation!.length; i++)
        {
          totalPrice = int.parse((provider.cartInformation![i].price!).substring(3))* provider.cartInformation![i].value!+totalPrice;
        }
      }
    else{
      totalPrice = 0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      child: Consumer<CartServices>(
        builder: (context, state, index){
          if(state.cartInformation!.isEmpty)
            {
              return Center(child: Text('Your cart is empty', style: Theme.of(context).textTheme.headline4,),);
            }
          else{

            return totalPrice!=0?ListView(
              children: [
                Container(
                  height: 400,
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: state.cartInformation!.length,
                      itemBuilder: (context, index){
                        price = int.parse((state.cartInformation![index].price!).substring(3))* state.cartInformation![index].value!;

                        return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      margin: EdgeInsets.symmetric( horizontal:5, vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      width: width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.cartInformation![index].name!, style: Theme.of(context).textTheme.subtitle1,),
                              Text('Rs.$price', style: Theme.of(context).textTheme.subtitle1,),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(

                                child: Text(
                                  '-',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                onTap: (){
                                  setState(() {
                                    if(state.cartInformation![index].value!>0)
                                    {
                                      setState(() {
                                        state.cartInformation![index].value = state.cartInformation![index].value!-1;
                                        totalPrice = totalPrice - int.parse((state.cartInformation![index].price!).substring(3));
                                      });
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              Text(
                                state.cartInformation![index].value!.toString(),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              GestureDetector(
                                onTap: (){
                                  if(state.cartInformation![index].value!<state.cartModel[index].stockCount!)
                                  {
                                    setState(() {
                                      state.cartInformation![index].value=state.cartInformation![index].value!+1;
                                      totalPrice = totalPrice+int.parse((state.cartInformation![index].price!).substring(3));
                                    });
                                  }
                                },
                                child: Text(
                                  '+',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total Price: ${totalPrice.toString()}', style: Theme.of(context).textTheme.headline1,),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(left:10, right:10, top: 20),
                  child: InkWell(
                    onTap: () {
                      // ignore: deprecated_member_use


                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CheckOut()));

                    },
                    child: Ink(
                      height: 40,
                      width: width,
                      color: Colors.red,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Checkout Now',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ):Center(child: Text('Your cart is empty', style: Theme.of(context).textTheme.headline4,),);
          }

        },
      ),
    );
  }
}
