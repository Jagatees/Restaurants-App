import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurantsapp/New-FramWork/models/brew.dart';
import 'package:restaurantsapp/New-FramWork/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('user');
  final CollectionReference feedBackCollection = Firestore.instance.collection('feedback');
  final CollectionReference transactionCollection = Firestore.instance.collection('transaction');

  Future<void> updateUserData(String name) async {
    return await brewCollection.document(uid).setData({
      'name': name,
    });
  }

  Future<void> sendFeedback(String feedback, double rating) async {
    return await feedBackCollection.add({
      'feedback': feedback,
      'rating': rating,
    });
  }

  Future<void> sendTransaction(var feedback) async {
    return await transactionCollection.add({
      'feedback': feedback,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Brew(
        name: doc.data['name'] ?? '',
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
    );
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
      .map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}