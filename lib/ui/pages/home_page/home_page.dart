import 'package:electronic_shop/ui/pages/product/product_page.dart';
import 'package:electronic_shop/ui/styles/colors.dart';
import 'package:flutter/material.dart';
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
    Container(color: Colors.red,),

  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

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
