import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';



class UserInfo extends StatefulWidget {

//  final String UID;
//  const UserInfo(this.UID);

  @override
  _UserInfoState createState() => _UserInfoState();

}


class _UserInfoState extends State<UserInfo> {
  var UserNameController = TextEditingController();
  var RoleController = TextEditingController();
  Database database = new Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info Page'),
      ),

      body : StreamBuilder(
        stream: Firestore.instance.collection('user').snapshots(),
        // ignore: missing_return
        builder: (context, snapshot){
          UserNameController.text = snapshot.data.documents[0]['name'];
          RoleController.text = snapshot.data.documents[0]['role'];
          if(!snapshot.hasData) return Text('No Information Found');
          return Column (children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter your username'
              ),
              controller: UserNameController ,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter your Role'
              ),
              controller: RoleController ,
            ),

            new RaisedButton(
              child: const Text('Update Information'),
              onPressed:  () async {
                final FirebaseUser user = await FirebaseAuth.instance.currentUser();
                final String uid = user.uid.toString();
                database.updateUserInfo_withUID('user', uid.toString(), UserNameController.text, RoleController.text);
              },
            ),

          ],
          );
        },
      ),
    );
  }
}
