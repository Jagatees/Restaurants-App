import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationData {
  DateTime _dateTime;
  String timeSlots;
  int slots;
  bool isAvailable;

  ReservationData(
      {DateTime dateTime, this.timeSlots, this.slots, this.isAvailable}){
        _dateTime = dateTime;
      }

  factory ReservationData.fromDocumentSnapShot(
      DocumentSnapshot documentSnapshot) {
    return ReservationData(
        dateTime: DateTime.parse(documentSnapshot.documentID),
        timeSlots: documentSnapshot.data["Timeslot"],
        slots: documentSnapshot.data["Slots"],
        isAvailable: documentSnapshot.data["Available"]);
  }

  String get dateTime => "${this._dateTime.day}/${this._dateTime.month}/${this._dateTime.year}";

  @override
  String toString() {
    return "Reservation on ${this._dateTime} has ${this.slots} from ${this.timeSlots} and is ${this.isAvailable}";
  }
}
