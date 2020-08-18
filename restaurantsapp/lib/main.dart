import 'package:flutter/material.dart';
import 'package:restaurantsapp/payment_service.dart';

import 'feedback_form.dart';
import 'profile.dart';
import 'payment.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Meun Development Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Main Meun Development Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() { // start striper system
    // TODO: implement initState
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Main Meun',
            ),

            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedBackForm()),
                );
              },
              child: Text(
                "Feedback Form",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
              child: Text(
                "Profile Page",
                style: TextStyle(fontSize: 20.0),
              ),
            ),

            FlatButton (
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed : () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              child: Text(
                "Payment Page",
                style: TextStyle(fontSize: 20.0),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
