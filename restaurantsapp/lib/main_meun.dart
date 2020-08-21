import 'package:flutter/material.dart';

import 'profile.dart';
import 'feedback_form.dart';
import 'delivery.dart';
import 'payment.dart';


class MainMeun extends StatefulWidget {
  @override
  _MainMeunState createState() => _MainMeunState();
}

class _MainMeunState extends State<MainMeun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Meun'),
      ),

      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('Sam'),
                accountEmail: new Text('jagateesvaran'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage('images/unnamed.jpg'),
              ),
            ),
            new ListTile(
              title: new Text('About Page'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              } ,
            ),

            new Divider(
              color: Colors.black,
              height: 5.0,
            ),

            new ListTile(
              title: new Text('About Page'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              } ,
            ),


          ],
        ),
      ),
    );
  }
}
