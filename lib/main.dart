import 'package:electronic_shop/core/services/cart_services.dart';
import 'package:electronic_shop/core/services/product_services.dart';
import 'package:electronic_shop/core/services/validation.dart';
import 'package:electronic_shop/ui/pages/splash_screen/splash_screen.dart';
import 'package:electronic_shop/ui/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/login_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LoginServices()),
        ChangeNotifierProvider(create: (_)=>ProductServices()),
        ChangeNotifierProvider(create: (_)=>CartServices()),
        ChangeNotifierProvider(create: (_)=>Validation()),
      ],
      child: MaterialApp(
        title: 'Electronic Shop',
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.baseTheme,
      ),
    );
  }
}


