import 'package:flutter/material.dart';
import 'widgets/drawer.dart';

class MainMeun extends StatefulWidget {
  @override
  _MainMeunState createState() => _MainMeunState();
}

class _MainMeunState extends State<MainMeun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Meun'),
      ),
      drawer: CustomDrawer() 
    );
  }
}
