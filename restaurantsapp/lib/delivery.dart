import 'package:flutter/material.dart';
import 'dart:ui';


List<String> _locations = ['Cash', 'Card'];
String _selectedEventStatus;


class Delivery extends StatefulWidget {
  _Delivery createState() => _Delivery();
}


class _Delivery extends State<Delivery> {
  @override
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
              value: _selectedEventStatus,
              onChanged: (newValue) {
                setState(() {
                  _selectedEventStatus = newValue;
                });
              },
              items: _locations.map((location) {
                return DropdownMenuItem(
                  child: new Text(location),
                  value: location,
                );
              }).toList(),
            ),

          ],
        ),
      ),
    );
  }


}
