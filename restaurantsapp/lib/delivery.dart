import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantsapp/check_out.dart';
import 'package:restaurantsapp/screens/Screen-Arguments/checkout.dart';


class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Form'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.location_on),
                hintText: 'Where do you want food to be delivered to ?',
                labelText: 'Delivery Location',
                ),
              ),


              Text(
                'Shoe Order in a card Form'
              ),

              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "/Checkout", arguments: ScreenArgumentsCheckout(100.90));
                },
                child: Text(
                  "Proceed to Payment",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),

            ],
        ),
      ),
    );
  }
}
