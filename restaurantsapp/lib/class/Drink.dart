import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Drink{

  String ID;
  String Name;
  String ImageURL;

  Drink({@required this.ID,@required this.Name,@required this.ImageURL});


  @override
  String toString() {
    return "DrinkID ${this.ID}: The drinks is ${this.Name} with ${this.ImageURL} as the URL";
  }

  factory Drink.fromDocumentSnapShot(DocumentSnapshot documentSnapshot){
    return Drink(Name: documentSnapshot.data["Name"], ImageURL: documentSnapshot.data["imageLink"], ID: documentSnapshot.documentID);
  }


}