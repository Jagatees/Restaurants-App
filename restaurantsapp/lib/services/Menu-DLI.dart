import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../screens/Main-Menu/bloc/MenuBloc.dart';

class MenuDLI{
  
  final firestoreInstance = Firestore.instance;
  DocumentReference reference;
  
  MenuDLI();

  GetDrinks({@required MenuBloc menuBloc}){

    Firestore.instance.collection('Menu').document("Drinks").collection("Drinks").getDocuments().then((querySnapshot){
      querySnapshot.documents.forEach((result){
        print(result.data);
      });
    });


  }

}