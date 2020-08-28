import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantsapp/screens/wrapper.dart';
import 'package:restaurantsapp/services/auth.dart';
import '../class/user.dart';
import 'Main-Menu/main_meun.dart';
import 'Cart/cart.dart';
import '../check_out.dart';
import '../screens/Reservation/Reservation.dart';
import '../screens/Reservation/Reservation-Info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: <String, WidgetBuilder>{
          '/Main-Menu': (BuildContext context) => MainMenu(),
          '/Cart': (BuildContext context) => Cart(),
          CheckOut.routeName: (BuildContext context) => CheckOut(),
          Reservation.routeName: (BuildContext context) => Reservation(),
          ReservationInfo.routeName: (BuildContext context) => ReservationInfo(),
        },
      ),
    );
  }
}
