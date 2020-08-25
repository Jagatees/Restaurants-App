import 'package:flutter/material.dart';

class Cart extends StatefulWidget{

  //Defualt construtor
  Cart();

  @override
  State<StatefulWidget> createState() => _CartState();

}

class _CartState extends State<Cart>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Cart View"),),
      body: Center(child: Text("Hello Cart View"),),
    );

  }
}