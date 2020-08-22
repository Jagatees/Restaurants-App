
import 'package:cloud_firestore/cloud_firestore.dart';
final firestoreInstance = Firestore.instance;

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


}