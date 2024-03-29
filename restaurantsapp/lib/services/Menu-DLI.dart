import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../screens/bloc/MenuBloc.dart';
import '../class/Drink.dart';

class MenuDLI{
  
  final firestoreInstance = Firestore.instance;
  DocumentReference reference;
  
  MenuDLI();

  void getDrinks({@required MenuBloc menuBloc}){

    Firestore.instance.collection('Menu').document("Drinks").collection("Drinks").getDocuments().then((querySnapshot){
      querySnapshot.documents.forEach((result){
        //Create an object 
        Drink drink = Drink.fromDocumentSnapShot(result);
        
        //Sink the object into the bloc
        menuBloc.drinkAdd.add(drink);

      });
    });


  }

}