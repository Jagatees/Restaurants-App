import 'package:flutter/material.dart';
import 'dart:ui';

import 'payment.dart';


List<String> _locations = ['Cash', 'Card'];
String _selectedPaymentMethod = _locations[0];


class Delivery extends StatefulWidget {
  _Delivery createState() => _Delivery();
}


class _Delivery extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter your Address'
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('Estimate Time of delivery : 30min'),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('Food Order'),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('Total Price 100 SGD'),
            ),


            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                  'Chose Payment Method'
              ),
            ),

            DropdownButton(
              hint: Text('Please choose a Event Status'), // Not necessary for Option 1
              value: _selectedPaymentMethod,
              onChanged: (newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue;
                });
              },
              items: _locations.map((location) {
                return DropdownMenuItem(
                  child: new Text(location),
                  value: location,
                );
              }).toList(),
            ),

            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {

                if(_selectedPaymentMethod == 'Cash')
                {
                  // go to the page to show the


                }
                else if (_selectedPaymentMethod == 'Card')
                {
                  // Go to the Card Page to Pay
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                }

              },
              child: Text(
                "Check Out Page",
                style: TextStyle(fontSize: 20.0),
              ),
            ),

          ],
        ),
      ),
    );
  }


}
