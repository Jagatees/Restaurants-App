import 'package:flutter/material.dart';
import 'payment_service.dart';
import 'package:restaurantsapp/payment_service.dart';
import 'package:restaurantsapp/credit_card.dart';
import 'screens/Screen-Arguments/checkout.dart';


// ignore: must_be_immutable
class CheckOut extends StatefulWidget {

  static const routeName = "/Checkout";

  CheckOut();

  @override
  CheckOutPageState createState() => CheckOutPageState();
}

class CheckOutPageState extends State<CheckOut> {

  CreditCard _creditCard = new CreditCard();


  @override
  void initState() {
    super.initState();
    StripeService.init();

  }

  @override
  Widget build(BuildContext context) {

    final ScreenArgumentsCheckout args = ModalRoute.of(context).settings.arguments;

    print(args.amount);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                _creditCard.payViaNewCard(context, args.amount);
              },
              child: Text(
                "Pay with Card",
                style: TextStyle(fontSize: 20.0),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
