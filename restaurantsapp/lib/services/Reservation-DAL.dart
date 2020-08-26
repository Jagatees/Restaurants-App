import 'package:cloud_firestore/cloud_firestore.dart';
import '../class/Reservation-Data.dart';

class ReservationDAL{
    
  final firestoreInstance = Firestore.instance;
  DocumentReference reference;
  
  ReservationDAL();

  void getReservations(){

    Firestore.instance.collection('Reservation').getDocuments().then((querySnapshot){
      querySnapshot.documents.forEach((result){

        //Create an object 
        ReservationData reservationData = ReservationData.fromDocumentSnapShot(result);
        print(reservationData.toString());
        
        //TODO: Sink the object into the bloc
        

      });
    });


  }
}