import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_database.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController etUsername = new TextEditingController();
  TextEditingController etRole = new TextEditingController();
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
          if(!snapshot.hasData) return Text('No Information Found');
          return Column (children: <Widget>[
             TextFormField(
               controller: TextEditingController(text: etUsername.text = snapshot.data.documents[0]['name']),
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your first and last name',
                labelText: 'Name',
              ),
            ),

            TextFormField(
              controller: TextEditingController(text: etRole.text = snapshot.data.documents[0]['role']),
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your first and last name',
                labelText: 'Name',
              ),
            ),

          Future<void> update(Map data) async {
          final user = await FirebaseAuth.instance.currentUser();
          return Firestore.instance.collection('Users').document(user.uid).updateData(data);
          }



            new RaisedButton(
              child: const Text('Update Information'),
              onPressed: () {
                //database.SendDateUpdate(etRole.text.toString(), etUsername.text, etRole.text);
              },
            ),



          ],
          );
        },
      ),
    );
  }
}
