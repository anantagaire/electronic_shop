import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
