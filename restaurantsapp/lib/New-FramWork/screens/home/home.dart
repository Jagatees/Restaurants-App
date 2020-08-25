
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantsapp/New-FramWork/models/brew.dart';
import 'package:restaurantsapp/New-FramWork/screens/home/settings_form.dart';
import 'package:restaurantsapp/New-FramWork/services/auth.dart';
import 'package:restaurantsapp/New-FramWork/services/database.dart';
import 'package:restaurantsapp/widgets/drawer.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
          drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('Home'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Profile'),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}