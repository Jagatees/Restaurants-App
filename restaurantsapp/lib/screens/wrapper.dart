
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantsapp/class/user.dart';
import 'package:restaurantsapp/screens/Main-Menu/main_meun.dart';

import '../screens/authenticate/authenticate.dart';
//import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return MainMenu();
    }
    
  }
}