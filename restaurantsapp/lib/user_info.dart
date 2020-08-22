import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

String userInfo_Name = 'User_1234';
String userInfo_Role = 'Customer';
String userInfo_Address = 'Jurong East';

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new TextFormField(
              initialValue: userInfo_Name,
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your first and last name',
                labelText: 'Name',
              ),
            ),


            new TextFormField(
              initialValue: userInfo_Role,
              decoration: const InputDecoration(
                icon: const Icon(Icons.feedback),
                hintText: 'Enter your first and last name',
                labelText: 'Role',
              ),
            ),

            new TextFormField(
              initialValue: userInfo_Address,
              decoration: const InputDecoration(
                icon: const Icon(Icons.home),
                hintText: 'Enter your first and last name',
                labelText: 'Address',
              ),
            ),



            new RaisedButton(
              child: const Text('Update Information'),
              onPressed: () {


              },
            ),

          ],
        ),
      ),
    );
  }
}
