import 'package:flutter/material.dart';
import 'package:restaurantsapp/check_out.dart';
import 'package:restaurantsapp/screens/Main-Menu/main_meun.dart';
import '../profile.dart';
import '../feedback_form.dart';
import '../delivery.dart';
import '../screens/Reservation/Reservation.dart';



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

            new ListTile(
              title: new Text('Resturant Info'),
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
                  'Feedback Form'
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
                  'Delivery'
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Delivery()),
                );
              } ,
            ),

            new ListTile(
              title: new Text(
                  'Reservation'
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Reservation.routeName);
              } ,
            ),



          ],
        ),
      );
  }
}