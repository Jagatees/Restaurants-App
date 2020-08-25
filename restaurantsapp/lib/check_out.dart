import 'package:flutter/material.dart';
import 'payment_service.dart';

import 'package:restaurantsapp/payment_service.dart';
import 'package:restaurantsapp/credit_card.dart';


class CheckOut extends StatefulWidget {
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
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                _creditCard.payViaNewCard(context, '2100');
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