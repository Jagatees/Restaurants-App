import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMeunState createState() => _MainMeunState();
}

class _MainMeunState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      drawer: CustomDrawer(),
      body: Container(
          child: Center(
        child: StreamBuilder(
          builder: (context, snapshot) {
            if(snapshot.hasData){
              
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      )),
    );
  }
}
