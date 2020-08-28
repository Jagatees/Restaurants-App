
import 'package:flutter/material.dart';
import 'package:restaurantsapp/check_out.dart';
import 'package:restaurantsapp/screens/Main-Menu/main_meun.dart';
import 'package:restaurantsapp/screens/home/settings_form.dart';
import 'package:restaurantsapp/services/auth.dart';
import 'package:restaurantsapp/services/database.dart';
import 'package:restaurantsapp/shared/loading.dart';
import '../profile.dart';
import '../feedback_form.dart';
import '../delivery.dart';
import '../screens/Reservation/Reservation.dart';
import 'package:restaurantsapp/class/user.dart';
import 'package:provider/provider.dart';


final AuthService _auth = AuthService();

class CustomDrawer extends StatelessWidget{
  const CustomDrawer();

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }


    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userData = snapshot.data;
            return Drawer(
              child: Column(
                children: <Widget>[

                  UserAccountsDrawerHeader(
                    accountName: new Text('UserName'),
                    accountEmail: new Text(snapshot.data.name),
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


                  new ListTile(
                    title: new Text(
                        'Profile'
                    ),
                    onTap: ()  {
                      _showSettingsPanel();
                    } ,
                  ),

                  new ListTile(
                    title: new Text(
                        'Logout'
                    ),
                    onTap: () async {
                      await _auth.signOut();
                    },
                  ),


                ],
              ),
            );
          } else {
            return Loading();
          }
        }
    );
  }
}