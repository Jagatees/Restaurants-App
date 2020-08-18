import 'package:flutter/material.dart';


class Profile extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/unnamed.jpg'),
            ),
            Text(
              'SHOP NAME',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Software Engineer',
              style: TextStyle(
                fontFamily: 'SansPro',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 25.0,
              width: 130.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.teal,
                ),
                title: Text(
                  'ADDRESS',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'SansPro',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  'PHONE NUMBER',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'SansPro',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
