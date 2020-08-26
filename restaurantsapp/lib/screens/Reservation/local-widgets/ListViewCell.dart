import 'package:flutter/material.dart';
import '../../../class/Reservation-Data.dart';

class ListViewCell extends StatelessWidget{

  List<ReservationData> reservationData = new List<ReservationData>();
  String date;
  ListViewCell(this.reservationData, this.date);


  @override
  Widget build(BuildContext context) {
    return Text(reservationData[0].toString());
  }
}