import 'package:flutter/material.dart';
import 'package:restaurantsapp/screens/Main-Menu/main_meun.dart';
import 'package:restaurantsapp/screens/Cart/cart.dart';
import 'package:restaurantsapp/check_out.dart';
import 'package:restaurantsapp/sign_in.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Development App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        '/Main-Menu': (BuildContext context) => MainMenu(),
        '/Cart': (BuildContext context) => Cart(),
        '/Checkout': (BuildContext context) => CheckOut("99")
      },
      home: SignIn(),
    );
  }
}



