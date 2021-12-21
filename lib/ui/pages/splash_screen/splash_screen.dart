import 'dart:async';

import 'package:electronic_shop/core/services/product_services.dart';
import 'package:electronic_shop/ui/pages/home_page/home_page.dart';
import 'package:electronic_shop/ui/pages/login_screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  
  
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), (){
      if(firebaseAuth.currentUser==null)
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginPage()));
        }
      else{
        Provider.of<ProductServices>(context, listen: false).getProductList(0,0,[]);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>HomePage()));
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.3,
              ),
              Container(
                height: height * 0.2,
                width: width * 1.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/splashscreen/splashscreen.png'),
                      fit: BoxFit.contain),
                ),
              ),
              Text(
                'Electronic Shop',
                style: Theme.of(context).textTheme.headline1,
                ),

            ],
          ),
        ));
  }
}
