import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../screens/Main-Menu/bloc/MenuBloc.dart';
import '../class/Drink.dart';

class MenuDLI{
  
  final firestoreInstance = Firestore.instance;
  DocumentReference reference;
  
  MenuDLI();

  GetDrinks({@required MenuBloc menuBloc}){

    Firestore.instance.collection('Menu').document("Drinks").collection("Drinks").getDocuments().then((querySnapshot){
      querySnapshot.documents.forEach((result){
        
        //Create an object 
        var data = result.data;
        Drink drink = Drink(Name: data["Name"], ImageURL: data["imageLink"], ID: result.documentID);
        
        //Sink the object into the bloc
        menuBloc.drinkAdd.add(drink);

      });
    });


  }

}