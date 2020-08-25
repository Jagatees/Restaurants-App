import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurantsapp/class/Menu.dart';

class Drink extends Menu{ 

  String ImageURL;

  Drink({String ID,@required String Name,@required this.ImageURL}):super(ID,Name);


  @override
  String toString() {
    return "DrinkID ${this.ID}: The drinks is ${this.Name} with ${this.ImageURL} as the URL";
  }

  factory Drink.fromDocumentSnapShot(DocumentSnapshot documentSnapshot){
    return Drink(Name: documentSnapshot.data["Name"], ImageURL: documentSnapshot.data["imageLink"], ID: documentSnapshot.documentID);
  }


}