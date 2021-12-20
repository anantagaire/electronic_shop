import 'package:electronic_shop/core/services/product_services.dart';
import 'package:electronic_shop/ui/pages/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductPage extends StatelessWidget {
  final _colors = [
    Colors.green,
    Colors.deepPurpleAccent,
    Colors.deepOrangeAccent,
    Colors.indigo,
    Colors.lime,
    Colors.pinkAccent
  ];
   ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: ()async{
          await Provider.of<ProductServices>(context, listen: false).getProductList(0,0,[]);

        },
        child: Consumer<ProductServices>(
          builder: (context, state, child)
          {
            if(state.products==null)
              {
                print(state.products);
                return Center(child: CircularProgressIndicator(),);
              }
            else{
              return Container(
                padding: EdgeInsets.only(top: 20),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: width*0.4/145,
                    ),
                    itemCount: state.products!.length,

                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProductDetails(data: state.products![index])));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.grey,
                                    height: 105,
                                    width: width*0.4,
                                    child: Image.network(state.products![index].image!, height: 105, width: width*0.4, fit: BoxFit.cover,)
                                ),
                                SizedBox(height: 10,),

                                Text(state.products![index].name!, style: Theme.of(context).textTheme.bodyText2,),
                                SizedBox(height: 10,),
                                Text(state.products![index].price!, style: Theme.of(context).textTheme.caption,),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }
          },
        ),
      )
    );
  }
}

