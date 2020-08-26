import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationData {
  DateTime dateTime;
  String timeSlots;
  int slots;
  bool isAvailable;

  ReservationData(
      {this.dateTime, this.timeSlots, this.slots, this.isAvailable});

  factory ReservationData.fromDocumentSnapShot(
      DocumentSnapshot documentSnapshot) {
    return ReservationData(
        dateTime: DateTime.parse(documentSnapshot.documentID),
        timeSlots: documentSnapshot.data["Timeslot"],
        slots: documentSnapshot.data["Slots"],
        isAvailable: documentSnapshot.data["Available"]);
  }

  @override
  String toString() {
    return "Reservation on ${this.dateTime} has ${this.slots} from ${this.timeSlots} and is ${this.isAvailable}";
  }
}
