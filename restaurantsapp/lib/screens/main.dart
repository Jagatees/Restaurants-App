import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantsapp/screens/wrapper.dart';
import 'package:restaurantsapp/services/auth.dart';
import '../class/user.dart';
import 'Main-Menu/main_meun.dart';
import 'Cart/cart.dart';
import '../check_out.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: <String, WidgetBuilder>{
          '/Main-Menu': (BuildContext context) => MainMenu(),
          '/Cart': (BuildContext context) => Cart(),
          '/Checkout': (BuildContext context) => CheckOut(),
        },
      ),
    );
  }
}
