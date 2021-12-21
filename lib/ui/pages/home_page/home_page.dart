import 'package:electronic_shop/core/services/product_services.dart';
import 'package:electronic_shop/ui/pages/cart/cart_page.dart';
import 'package:electronic_shop/ui/pages/product/filter_page.dart';
import 'package:electronic_shop/ui/pages/product/product_page.dart';
import 'package:electronic_shop/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final _tabs=[

    ProductPage(),
    CartPage()

  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Electronic Shop', style: Theme.of(context).textTheme.bodyText1,),
        actions: _currentIndex==0?[
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>FilterPage()));

          }, icon: FaIcon(Icons.filter_list_alt))
        ]:[],
      ),

      body: _tabs[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      margin: EdgeInsets.only(left: width*0.16, right: width*0.16),
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: AppColors.textColor,
        ),

        SalomonBottomBarItem(
          icon: Icon(Icons.shopping_cart_rounded),
          title: Text("Cart"),
          selectedColor: AppColors.textColor,
        ),


      ],
    ),



    );
  }
}
