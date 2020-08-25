import 'package:flutter/material.dart';
import 'package:restaurantsapp/check_out.dart';
import 'package:restaurantsapp/screens/Main-Menu/main_meun.dart';
import '../profile.dart';
import '../feedback_form.dart';



class CustomDrawer extends StatelessWidget{
  
  const CustomDrawer();

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('Sam'),
                accountEmail: new Text('jagateesvaran'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage('assets/images/profile_picture.jpg'),
              ),
            ),
            new ListTile(
              title: new Text('Shop Info'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              } ,
            ),

            new ListTile(
              title: new Text(
                  'Feedback Info'
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedBackForm()),
                );
              } ,
            ),

            new ListTile(
              title: new Text(
                  'Credit Cards Real'
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckOut()),
                );
              } ,
            ),

            new ListTile(
              title: new Text(
                  'Home'
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainMenu()),
                );
              } ,
            ),



          ],
        ),
      );
  }
}