import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestoreInstance = Firestore.instance;


DocumentReference reference;


class Database{

  void sendFeedbackToDatabase(String collection, double score, String feedback) {
    firestoreInstance.collection(collection).add(
        {
          "score" : score,
          "feedback" : feedback,
        }).then((value){
    });
  }

  void sendPaymentRecordToDatabase(var x) {
    firestoreInstance.collection('transtions').add(x);
  }


  void sendUserInfo_withUID(String userID, String name, String role){
    reference = Firestore.instance.document("user/" + userID);
    Map<String, String> yourData =
    {
      "name" : name,
      "role" : role,
    };
    reference.setData(yourData);
  }

  void updateUserInfo_withUID(String collection, String documents, String name, String role){
   Firestore.instance.collection('user').document(documents.toString()).updateData(
       {
         "name" : name,
         "role" : role,
       }
   );
  }


}