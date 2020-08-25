import 'package:flutter/material.dart';
import 'package:restaurantsapp/check_out.dart';
import '../profile.dart';
import '../feedback_form.dart';
import '../user_info.dart';

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
              title: new Text('Profile Info'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInfo()),
                );
              },
            ),

            new Divider(
              color: Colors.black,
              height: 5.0,
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
                  'Credit Cards'
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckOut('10')),
                );
              } ,
            ),



          ],
        ),
      );
  }
}