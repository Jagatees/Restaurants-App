import 'package:flutter/material.dart';
import 'package:restaurantsapp/class/Reservation-Data.dart';
import '../../services/Reservation-DAL.dart';

class Reservation extends StatefulWidget{
  
  static const routeName = "/Reservation";

  //Defualt construtor
  Reservation();

  @override
  State<StatefulWidget> createState() => _ReservationState();

}

class _ReservationState extends State<Reservation>{


  @override
  void initState() {
    super.initState();

    ReservationDAL reservationDAL  = ReservationDAL();
    reservationDAL.getReservations();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text("Reservation")), body:Center(child: Text("Hello Reservation")));

  }
}