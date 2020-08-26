import 'package:cloud_firestore/cloud_firestore.dart';
import '../class/Reservation-Data.dart';
import '../screens/bloc/ReservationBloc.dart';

class ReservationDAL{
    
  final firestoreInstance = Firestore.instance;
  DocumentReference reference;
  
  ReservationDAL();

  void getReservations(ReservationBloc reservationBloc){

    Firestore.instance.collection('Reservation').getDocuments().then((querySnapshot){
      querySnapshot.documents.forEach((result){

        //Create an object 
        ReservationData reservationData = ReservationData.fromDocumentSnapShot(result);
        
        //Sink the object into the bloc
        reservationBloc.reservationAdd.add(reservationData);
        

      });
    });


  }
}