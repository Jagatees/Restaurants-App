import 'package:flutter/material.dart';


class Payments extends StatefulWidget {
  @override
  _PaymentsPageState createState() =>  _PaymentsPageState();
}

class  _PaymentsPageState extends State<Payments> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Text('Choose Existing card'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child:  Text(
            'asd'
          ),
        ),
    );
  }
}
